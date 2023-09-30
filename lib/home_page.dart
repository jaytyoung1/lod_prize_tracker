import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lod_prize_tracker/application/fantasy_team/bloc.dart';
import 'package:lod_prize_tracker/infrastructure/fantasy_team/fantasy_team_repository.dart';
import 'package:lod_prize_tracker/presentation/pages/points_allowed/points_allowed_page.dart';
import 'package:lod_prize_tracker/presentation/pages/points_for/points_for_page.dart';
import 'package:lod_prize_tracker/presentation/pages/splash_page.dart';
import 'package:lod_prize_tracker/presentation/pages/standings/standings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int pageIndex = 0;

  pageIndexCallback(index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var pages = [];
    return MultiBlocProvider(
      providers: [
        BlocProvider<FantasyTeamBloc>(
            create: (_) =>
                FantasyTeamBloc(fantasyTeamRepository: FantasyTeamRepository())
                  ..add(LoadFantasyTeams(
                      year: DateFormat('yyyy').format(DateTime.now())))),
      ],
      child: BlocBuilder<FantasyTeamBloc, FantasyTeamState>(
        builder: (BuildContext context, FantasyTeamState state) {
          if (state is FantasyTeamStateLoaded) {
            // return const SplashPage();
            pages = [
              StandingsPage(
                fantasyTeams: state.fantasyTeamsRanked,
              ),
              PointsForPage(
                fantasyTeams: state.fantasyTeamsPointsFor,
              ),
              PointsAllowedPage(
                fantasyTeams: state.fantasyTeamsPointsAllowed,
              ),
            ];

            return Scaffold(
              appBar: AppBar(
                centerTitle: false,
                title: Text(widget.title),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: PopupMenuButton<String>(
                      onSelected: (value) {
                        BlocProvider.of<FantasyTeamBloc>(context).add(
                          LoadFantasyTeams(year: value),
                        );
                      },
                      padding: const EdgeInsets.all(0.0),
                      icon: SizedBox(
                        width: 60,
                        child: Text(
                          state.year,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      itemBuilder: (BuildContext context) {
                        return const [
                          PopupMenuItem<String>(
                            value: '2023',
                            child: Text('2023'),
                          ),
                          PopupMenuItem<String>(
                            value: '2022',
                            child: Text('2022'),
                          ),
                          PopupMenuItem<String>(
                            value: '2020',
                            child: Text('2020'),
                          ),
                          PopupMenuItem<String>(
                            value: '2019',
                            child: Text('2019'),
                          ),
                          PopupMenuItem<String>(
                            value: '2018',
                            child: Text('2018'),
                          ),
                          PopupMenuItem<String>(
                            value: '2017',
                            child: Text('2017'),
                          ),
                        ];
                      },
                    ),
                  )
                ],
              ),
              body: pages[pageIndex],
              bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.list,
                    ),
                    label: 'Standings',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.map),
                    label: 'Points For',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.star),
                    label: 'Points Allowed',
                  ),
                ],
                currentIndex: pageIndex,
                type: BottomNavigationBarType.fixed,
                onTap: (i) {
                  // If navigating back to the list page, reload the restaurants
                  // if (i == 0) {
                  //   BlocProvider.of<RestaurantsBloc>(context).add(
                  //     RefreshRestaurants(range: null, day: currentDay),
                  //   );
                  // }
                  setState(() {
                    pageIndex = i;
                  });
                },
              ),
            );
          }
          return const SplashPage();
        },
      ),
    );
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _incrementCounter,
    //     tooltip: 'Increment',
    //     child: Icon(Icons.add),
    //   ),
    // );
  }
}
