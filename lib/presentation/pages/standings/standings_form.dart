import 'package:flutter/material.dart';
import 'package:lod_prize_tracker/domain/fantasy_team/fantasy_team.dart';

class StandingsForm extends StatelessWidget {
  final List<FantasyTeam> fantasyTeams;

  const StandingsForm({
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
            leading: Text(fantasyTeams[index].playoffSeed.toString()),
            title: Text(
                '${fantasyTeams[index].location!} ${fantasyTeams[index].nickname!}'),
            trailing: Text(
                '${fantasyTeams[index].record.overall!.wins}-${fantasyTeams[index].record.overall!.losses}'),
          ),
        );
      },
    );
  }
}
