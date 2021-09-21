import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lod_prize_tracker/application/fantasy_team/fantasy_team.dart';
import 'package:lod_prize_tracker/presentation/pages/points_allowed/points_allowed_page.dart';
import 'package:lod_prize_tracker/presentation/pages/points_for/points_for_page.dart';
import 'package:lod_prize_tracker/presentation/pages/standings/standings_page.dart';
import 'infrastructure/fantasy_team/fantasy_team_repository.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  ..add(LoadFantasyTeams())),
      ],
      child: BlocBuilder<FantasyTeamBloc, FantasyTeamState>(
        builder: (BuildContext context, FantasyTeamState state) {
          if (state is FantasyTeamStateLoaded) {
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
                title: Text(widget.title),
              ),
              body: pages[pageIndex],
              bottomNavigationBar: BottomNavigationBar(
                items: [
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
          return Center(child: CircularProgressIndicator());
        },
        // child: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       Text(
        //         'You have pushed the button this many times:',
        //       ),
        //       Text(
        //         '$_counter',
        //         style: Theme.of(context).textTheme.headline4,
        //       ),
        //     ],
        //   ),
        // ),
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
