import 'package:flutter/material.dart';
import 'package:lod_prize_tracker/domain/fantasy_team/entities.dart';

class StandingsForm extends StatelessWidget {
  final List<FantasyTeam> fantasyTeams;

  StandingsForm({required this.fantasyTeams});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: fantasyTeams.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(fantasyTeams[index].logo),
                ),
              ),
            ),
            // leading: Text(fantasyTeams[index].playoffSeed.toString()),
            title: Text(fantasyTeams[index].location! +
                " " +
                fantasyTeams[index].nickname!),
          ),
        );
      },
    );
  }
}
