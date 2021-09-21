import 'package:flutter/material.dart';
import 'package:lod_prize_tracker/domain/fantasy_team/entities.dart';
import 'package:lod_prize_tracker/presentation/pages/standings/standings_form.dart';

class StandingsPage extends StatelessWidget {
  final List<FantasyTeam> fantasyTeams;

  StandingsPage({required this.fantasyTeams});

  @override
  Widget build(BuildContext context) {
    return StandingsForm(fantasyTeams: fantasyTeams);
  }
}
