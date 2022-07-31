// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:lod_prize_tracker/domain/fantasy_team/fantasy_team.dart';

void main() {
  test('Counter increments smoke test', () {
    FantasyTeam fantasyTeam = const FantasyTeam(
      playoffSeed: 1,
      location: 'Location',
      nickname: 'Nickname',
      logo: 'logo',
      record: Record(
        overall: OverallRecord(
          gamesBack: 1.0,
          losses: 0,
          percentage: 100.0,
          pointsAgainst: 200,
          pointsFor: 500,
          streakLength: 3,
          streakType: 'W',
          ties: 0,
          wins: 10,
        ),
      ),
    );

    expect(fantasyTeam, isNotNull);
  });
}
