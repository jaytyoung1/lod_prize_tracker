part of 'fantasy_team_bloc.dart';

@immutable
abstract class FantasyTeamState extends Equatable {
  const FantasyTeamState();

  @override
  List<Object> get props => [];
}

class FantasyTeamStateInitial extends FantasyTeamState {
  const FantasyTeamStateInitial();
}

class FantasyTeamStateLoading extends FantasyTeamState {
  const FantasyTeamStateLoading();
}

class FantasyTeamStateLoaded extends FantasyTeamState {
  final List<FantasyTeam> fantasyTeamsRanked;
  final List<FantasyTeam> fantasyTeamsPointsFor;
  final List<FantasyTeam> fantasyTeamsPointsAllowed;
  final String year;

  const FantasyTeamStateLoaded({
    required this.fantasyTeamsRanked,
    required this.fantasyTeamsPointsFor,
    required this.fantasyTeamsPointsAllowed,
    required this.year,
  });

  @override
  List<Object> get props => [
        fantasyTeamsRanked,
        fantasyTeamsPointsFor,
        fantasyTeamsPointsAllowed,
        year,
      ];
}
