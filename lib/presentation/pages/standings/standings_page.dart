import 'package:flutter/material.dart';
import 'package:lod_prize_tracker/domain/fantasy_team/fantasy_team.dart';
import 'package:lod_prize_tracker/presentation/pages/standings/standings_form.dart';

class StandingsPage extends StatelessWidget {
  final List<FantasyTeam> fantasyTeams;

  const StandingsPage({
    Key? key,
    required this.fantasyTeams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandingsForm(fantasyTeams: fantasyTeams);
  }
}
