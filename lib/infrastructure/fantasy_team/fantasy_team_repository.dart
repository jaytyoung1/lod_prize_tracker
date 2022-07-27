import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:lod_prize_tracker/domain/fantasy_team/fantasy_team.dart';

/// Implements the [IFantasyTeamRepository] interface using the ESPN APIs.
@LazySingleton(as: IFantasyTeamRepository)
class FantasyTeamRepository implements IFantasyTeamRepository {
  // example URL: https://fantasy.espn.com/apis/v3/games/ffl/seasons/2021/segments/0/leagues/447533?view=mTeam
  static const String leagueId = '447533';
  static const String year = '2021';
  static const String espnApiUrl =
      'https://fantasy.espn.com/apis/v3/games/ffl/seasons/$year/segments/0/leagues/$leagueId?view=';

  @override
  Future<List<FantasyTeam>> getFantasyTeamsRanked() async {
    List<FantasyTeam> fantasyTeams = [];
    const teamView = 'mTeam';
    final response = await http.get(
      Uri.parse(espnApiUrl + teamView),
    );

    if (response.statusCode == 200) {
      var teams = json.decode(response.body.replaceAll(r'\', ''))['teams'];

      fantasyTeams =
          (teams as List).map((e) => FantasyTeam.fromJson(e)).toList();

      fantasyTeams.sort((a, b) => a.playoffSeed!.compareTo(b.playoffSeed!));

      return fantasyTeams;
    } else {
      throw Exception('Failed to load ranked fantasy teams');
    }
  }

  @override
  Future<List<FantasyTeam>> getPointsFor() async {
    List<FantasyTeam> fantasyTeams = [];
    const teamView = 'mTeam';
    final response = await http.get(
      Uri.parse(espnApiUrl + teamView),
    );

    if (response.statusCode == 200) {
      var teams = json.decode(response.body.replaceAll(r'\', ''))['teams'];

      fantasyTeams =
          (teams as List).map((e) => FantasyTeam.fromJson(e)).toList();

      fantasyTeams.sort((a, b) =>
          b.record.overall!.pointsFor!.compareTo(a.record.overall!.pointsFor!));

      return fantasyTeams;
    } else {
      throw Exception('Failed to load ranked fantasy teams');
    }
  }

  @override
  Future<List<FantasyTeam>> getPointsAllowed() async {
    List<FantasyTeam> fantasyTeams = [];
    const teamView = 'mTeam';
    final response = await http.get(
      Uri.parse(espnApiUrl + teamView),
    );

    if (response.statusCode == 200) {
      var teams = json.decode(response.body.replaceAll(r'\', ''))['teams'];

      fantasyTeams =
          (teams as List).map((e) => FantasyTeam.fromJson(e)).toList();

      fantasyTeams.sort((a, b) => b.record.overall!.pointsAgainst!
          .compareTo(a.record.overall!.pointsAgainst!));

      return fantasyTeams;
    } else {
      throw Exception('Failed to load ranked fantasy teams');
    }
  }
}
