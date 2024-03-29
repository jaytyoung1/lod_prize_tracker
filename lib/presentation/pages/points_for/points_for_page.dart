import 'package:flutter/material.dart';
import 'package:lod_prize_tracker/domain/fantasy_team/fantasy_team.dart';
import 'package:lod_prize_tracker/presentation/pages/points_for/points_for_form.dart';

class PointsForPage extends StatelessWidget {
  final List<FantasyTeam> fantasyTeams;

  const PointsForPage({
    Key? key,
    required this.fantasyTeams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PointsForForm(fantasyTeams: fantasyTeams);
  }
}
