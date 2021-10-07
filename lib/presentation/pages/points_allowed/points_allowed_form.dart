import 'package:flutter/material.dart';
import 'package:lod_prize_tracker/domain/fantasy_team/fantasy_team.dart';

class PointsAllowedForm extends StatelessWidget {
  final List<FantasyTeam> fantasyTeams;

  PointsAllowedForm({required this.fantasyTeams});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: fantasyTeams.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: Text((index + 1).toString()),
            title: Text(fantasyTeams[index].location! +
                " " +
                fantasyTeams[index].nickname!),
            trailing: Text(fantasyTeams[index]
                .record
                .overall!
                .pointsAgainst!
                .toStringAsFixed(2)),
          ),
        );
      },
    );
  }
}
