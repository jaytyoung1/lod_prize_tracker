// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FantasyTeam _$FantasyTeamFromJson(Map<String, dynamic> json) => FantasyTeam(
      playoffSeed: json['playoffSeed'] as int?,
      location: json['location'] as String?,
      nickname: json['nickname'] as String?,
      logo: json['logo'] as String,
      record: Record.fromJson(json['record'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FantasyTeamToJson(FantasyTeam instance) =>
    <String, dynamic>{
      'playoffSeed': instance.playoffSeed,
      'location': instance.location,
      'nickname': instance.nickname,
      'logo': instance.logo,
      'record': instance.record,
    };

Record _$RecordFromJson(Map<String, dynamic> json) => Record(
      overall: json['overall'] == null
          ? null
          : OverallRecord.fromJson(json['overall'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecordToJson(Record instance) => <String, dynamic>{
      'overall': instance.overall,
    };

OverallRecord _$OverallRecordFromJson(Map<String, dynamic> json) =>
    OverallRecord(
      gamesBack: json['gamesBack'] as num?,
      losses: json['losses'] as int?,
      percentage: json['percentage'] as num?,
      pointsAgainst: json['pointsAgainst'] as num?,
      pointsFor: json['pointsFor'] as num?,
      streakLength: json['streakLength'] as int?,
      streakType: json['streakType'] as String?,
      ties: json['ties'] as int?,
      wins: json['wins'] as int?,
    );

Map<String, dynamic> _$OverallRecordToJson(OverallRecord instance) =>
    <String, dynamic>{
      'gamesBack': instance.gamesBack,
      'losses': instance.losses,
      'percentage': instance.percentage,
      'pointsAgainst': instance.pointsAgainst,
      'pointsFor': instance.pointsFor,
      'streakLength': instance.streakLength,
      'streakType': instance.streakType,
      'ties': instance.ties,
      'wins': instance.wins,
    };
