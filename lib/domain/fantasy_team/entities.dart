import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entities.g.dart';

/// Represents an ESPN Fantasy Football fantasy team.
@JsonSerializable()
class FantasyTeam extends Equatable {
  /// Overall team rank.
  final int? playoffSeed;

  /// Final standing.
  final int? rankCalculatedFinal;

  /// Represents the team name.
  final String? name;

  /// Represents the first part of the team name.
  final String? location;

  /// Represents the first part of the team name.
  final String? nickname;

  /// Represents the team's logo
  final String? logo;

  /// Represents the team's overall record
  final Record record;

  const FantasyTeam({
    required this.playoffSeed,
    required this.rankCalculatedFinal,
    required this.name,
    required this.location,
    required this.nickname,
    required this.logo,
    required this.record,
  });

  /// Factory constructor to create a [FantasyTeam] from json.
  factory FantasyTeam.fromJson(Map<String, dynamic> json) =>
      _$FantasyTeamFromJson(json);

  /// Helper method to convert a [FantasyTeam] to json.
  Map<String, dynamic> toJson() => _$FantasyTeamToJson(this);

  @override
  List<Object?> get props => [
        playoffSeed,
        rankCalculatedFinal,
        name,
        location,
        nickname,
        logo,
        record,
      ];
}

/// Represents a [FantasyTeam] record.
@JsonSerializable()
class Record extends Equatable {
  final OverallRecord? overall;

  const Record({
    required this.overall,
  });

  /// Factory constructor to create a [Record] from json.
  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);

  /// Helper method to convert a [Record] to json.
  Map<String, dynamic> toJson() => _$RecordToJson(this);

  @override
  List<Object?> get props => [overall];
}

/// Represents a [FantasyTeam] overall record.
@JsonSerializable()
class OverallRecord extends Equatable {
  /// Overall team rank.
  final num? gamesBack;

  /// Overall team rank.
  final int? losses;

  /// Overall team rank.
  final num? percentage;

  /// Overall team rank.
  final num? pointsAgainst;

  /// Overall team rank.
  final num? pointsFor;

  /// Overall team rank.
  final int? streakLength;

  /// Overall team rank.
  final String? streakType;

  /// Overall team rank.
  final int? ties;

  /// Overall team rank.
  final int? wins;

  const OverallRecord({
    required this.gamesBack,
    required this.losses,
    required this.percentage,
    required this.pointsAgainst,
    required this.pointsFor,
    required this.streakLength,
    required this.streakType,
    required this.ties,
    required this.wins,
  });

  /// Factory constructor to create a [OverallRecord] from json.
  factory OverallRecord.fromJson(Map<String, dynamic> json) =>
      _$OverallRecordFromJson(json);

  /// Helper method to convert a [OverallRecord] to json.
  Map<String, dynamic> toJson() => _$OverallRecordToJson(this);

  @override
  List<Object?> get props => [
        gamesBack,
        losses,
        percentage,
        pointsAgainst,
        pointsFor,
        streakLength,
        streakType,
        ties,
        wins,
      ];
}
