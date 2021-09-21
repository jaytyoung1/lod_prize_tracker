import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:lod_prize_tracker/domain/fantasy_team/fantasy_team.dart';

/// Implements the [IFantasyTeamRepository] interface using the ESPN APIs.
@LazySingleton(as: IFantasyTeamRepository)
class FantasyTeamRepository implements IFantasyTeamRepository {
  // example URL: https://fantasy.espn.com/apis/v3/games/ffl/seasons/2021/segments/0/leagues/447533?view=mTeam
  static const String leagueId = "447533";
  static const String year = "2021";
  static const String espnApiUrl =
      "https://fantasy.espn.com/apis/v3/games/ffl/seasons/" +
          year +
          "/segments/0/leagues/" +
          leagueId +
          "?view=";

  @override
  Future<List<FantasyTeam>> getFantasyTeamsRanked() async {
    List<FantasyTeam> _fantasyTeams = [];
    final teamView = "mTeam";
    final response = await http.get(
      Uri.parse(espnApiUrl + teamView),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // var teams = response.body['teams'];

      // String body = response.body;
      // String bodyEscaped = response.body.replaceAll(r"\", "");
      var teams = json.decode(response.body.replaceAll(r"\", ""))['teams'];
      // var test2 = json.decode(response.body);

      _fantasyTeams =
          (teams as List).map((e) => FantasyTeam.fromJson(e)).toList();

      _fantasyTeams.sort((a, b) => a.playoffSeed!.compareTo(b.playoffSeed!));

      // _fantasyTeams = List<FantasyTeam>.from(test)

      // _fantasyTeams = List<FantasyTeam>.from(
      //     test.map((model) => FantasyTeam.fromJson(model)));
      // return Album.fromJson(jsonDecode(response.body));
      return _fantasyTeams;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load ranked fantasy teams');
    }
  }

  @override
  Future<List<FantasyTeam>> getPointsFor() async {
    List<FantasyTeam> _fantasyTeams = [];
    final teamView = "mTeam";
    final response = await http.get(
      Uri.parse(espnApiUrl + teamView),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // var teams = response.body['teams'];

      // String body = response.body;
      // String bodyEscaped = response.body.replaceAll(r"\", "");
      var teams = json.decode(response.body.replaceAll(r"\", ""))['teams'];
      // var test2 = json.decode(response.body);

      _fantasyTeams =
          (teams as List).map((e) => FantasyTeam.fromJson(e)).toList();

      _fantasyTeams.sort((a, b) =>
          b.record.overall!.pointsFor!.compareTo(a.record.overall!.pointsFor!));

      // _fantasyTeams = List<FantasyTeam>.from(test)

      // _fantasyTeams = List<FantasyTeam>.from(
      //     test.map((model) => FantasyTeam.fromJson(model)));
      // return Album.fromJson(jsonDecode(response.body));
      return _fantasyTeams;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load ranked fantasy teams');
    }
  }
}
