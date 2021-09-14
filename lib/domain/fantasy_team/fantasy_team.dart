import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fantasy_team.g.dart';

/// Represents an ESPN Fantasy Football fantasy team.
@JsonSerializable()
class FantasyTeam extends Equatable {
  /// Overall team rank.
  final int? rank;

  /// Team name.
  final String? teamName;

  /// Total fantasy points for.
  final num? pointsFor;

  /// Total fantasy points against.
  final num? pointsAgainst;

  /// Overall win/loss record.
  final String? overallRecord;

  /// Home record.
  final String? homeRecord;

  /// Away record.
  final String? awayRecord;

  /// Streak.
  final String? streak;

  /// Total number of transactions.
  final int? moves;

  const FantasyTeam({
    required this.rank,
    required this.teamName,
    required this.pointsFor,
    required this.pointsAgainst,
    required this.overallRecord,
    required this.homeRecord,
    required this.awayRecord,
    required this.streak,
    required this.moves,
  });

  /// Factory constructor to create a [FantasyTeam] from json.
  factory FantasyTeam.fromJson(Map<String, dynamic> json) =>
      _$FantasyTeamFromJson(json);

  /// Helper method to convert a [FantasyTeam] to json.
  Map<String, dynamic> toJson() => _$FantasyTeamToJson(this);

  @override
  List<Object?> get props => [
        rank,
        teamName,
        pointsFor,
        pointsAgainst,
        overallRecord,
        homeRecord,
        awayRecord,
        streak,
        moves
      ];
}
