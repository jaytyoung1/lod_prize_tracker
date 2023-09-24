import 'package:flutter/material.dart';
import 'package:lod_prize_tracker/domain/fantasy_team/fantasy_team.dart';

class PointsForForm extends StatelessWidget {
  final List<FantasyTeam> fantasyTeams;

  const PointsForForm({
    Key? key,
    required this.fantasyTeams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: fantasyTeams.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: Text((index + 1).toString()),
            title: Text(fantasyTeams[index].name!),
            // title: Text(
            //     '${fantasyTeams[index].location!} ${fantasyTeams[index].nickname!}'),
            trailing: Text(fantasyTeams[index]
                .record
                .overall!
                .pointsFor!
                .toStringAsFixed(2)),
          ),
        );
      },
    );
  }
}
