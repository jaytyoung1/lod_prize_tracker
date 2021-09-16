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
  final List<FantasyTeam> fantasyTeams;

  const FantasyTeamStateLoaded({required this.fantasyTeams});

  @override
  List<Object> get props => [fantasyTeams];
}
