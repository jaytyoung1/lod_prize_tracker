import 'package:flutter/material.dart';
import 'package:lod_prize_tracker/domain/fantasy_team/fantasy_team.dart';
import 'package:lod_prize_tracker/presentation/pages/points_allowed/points_allowed_form.dart';

class PointsAllowedPage extends StatelessWidget {
  final List<FantasyTeam> fantasyTeams;

  PointsAllowedPage({required this.fantasyTeams});

  @override
  Widget build(BuildContext context) {
    return PointsAllowedForm(fantasyTeams: fantasyTeams);
  }
}
