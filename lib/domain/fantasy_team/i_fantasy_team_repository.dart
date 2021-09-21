import 'dart:async';
import 'fantasy_team.dart';

/// Defines an interface for the ESPN fantasy team repository
abstract class IFantasyTeamRepository {
  /// Gets list of fantasy teams.
  Future<List<FantasyTeam>> getFantasyTeamsRanked();

  /// Gets fantasy teams sorted by total points for.
  Future<List<FantasyTeam>> getPointsFor();

  /// Gets fantasy teams sorted by total points allowed.
  Future<List<FantasyTeam>> getPointsAllowed();
}
