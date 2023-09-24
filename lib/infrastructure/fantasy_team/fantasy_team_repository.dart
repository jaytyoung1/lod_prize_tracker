import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:lod_prize_tracker/domain/fantasy_team/fantasy_team.dart';

/// Implements the [IFantasyTeamRepository] interface using the ESPN APIs.
@LazySingleton(as: IFantasyTeamRepository)
class FantasyTeamRepository implements IFantasyTeamRepository {
  // example URL: https://fantasy.espn.com/apis/v3/games/ffl/seasons/2021/segments/0/leagues/447533?view=mTeam
  static const String leagueId = '447533';
  // static const String espnApiUrl =
  //     'https://fantasy.espn.com/apis/v3/games/ffl/seasons/$year/segments/0/leagues/$leagueId?view=';

  // Used for current year
  static const String espnApiUrlPart1 =
      'https://lm-api-reads.fantasy.espn.com/apis/v3/games/ffl/seasons/';
  static const String espnApiUrlPart2 = '/segments/0/leagues/$leagueId?view=';

  // Used for non-current years
  static const String leagueHistoryApiUrl =
      'https://lm-api-reads.fantasy.espn.com/apis/v3/games/ffl/leagueHistory/447533?view=mTeam&seasonId=';

  @override
  Future<List<FantasyTeam>> getFantasyTeamsRanked({
    required String year,
  }) async {
    List<FantasyTeam> fantasyTeams = [];
    Response response;
    const teamView = 'mTeam';
    if (year == DateFormat('yyyy').format(DateTime.now())) {
      response = await http.get(
        Uri.parse(espnApiUrlPart1 + year + espnApiUrlPart2 + teamView),
      );
    } else {
      response = await http.get(
        Uri.parse(leagueHistoryApiUrl + year),
      );
    }

    if (response.statusCode == 200) {
      dynamic teams;
      if (year == DateFormat('yyyy').format(DateTime.now())) {
        teams = json.decode(response.body)['teams'];
      } else {
        teams = json.decode(response.body.replaceAll(r'\', ''))[0]['teams'];
      }

      fantasyTeams =
          (teams as List).map((e) => FantasyTeam.fromJson(e)).toList();

      if (year == DateFormat('yyyy').format(DateTime.now())) {
        fantasyTeams.sort((a, b) => a.playoffSeed!.compareTo(b.playoffSeed!));
      } else {
        fantasyTeams.sort(
            (a, b) => a.rankCalculatedFinal!.compareTo(b.rankCalculatedFinal!));
      }

      return fantasyTeams;
    } else {
      throw Exception('Failed to load ranked fantasy teams');
    }
  }

  @override
  Future<List<FantasyTeam>> getPointsFor({
    required String year,
  }) async {
    List<FantasyTeam> fantasyTeams = [];
    Response response;
    const teamView = 'mTeam';
    if (year == DateFormat('yyyy').format(DateTime.now())) {
      response = await http.get(
        Uri.parse(espnApiUrlPart1 + year + espnApiUrlPart2 + teamView),
      );
    } else {
      response = await http.get(
        Uri.parse(leagueHistoryApiUrl + year),
      );
    }

    if (response.statusCode == 200) {
      dynamic teams;
      if (year == DateFormat('yyyy').format(DateTime.now())) {
        teams = json.decode(response.body)['teams'];
      } else {
        teams = json.decode(response.body.replaceAll(r'\', ''))[0]['teams'];
      }

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
  Future<List<FantasyTeam>> getPointsAllowed({
    required String year,
  }) async {
    List<FantasyTeam> fantasyTeams = [];
    Response response;
    const teamView = 'mTeam';
    if (year == DateFormat('yyyy').format(DateTime.now())) {
      response = await http.get(
        Uri.parse(espnApiUrlPart1 + year + espnApiUrlPart2 + teamView),
      );
    } else {
      response = await http.get(
        Uri.parse(leagueHistoryApiUrl + year),
      );
    }

    if (response.statusCode == 200) {
      dynamic teams;
      if (year == DateFormat('yyyy').format(DateTime.now())) {
        teams = json.decode(response.body)['teams'];
      } else {
        teams = json.decode(response.body.replaceAll(r'\', ''))[0]['teams'];
      }

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
