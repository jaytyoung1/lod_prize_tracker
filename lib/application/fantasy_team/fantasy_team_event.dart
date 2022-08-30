part of 'fantasy_team_bloc.dart';

abstract class FantasyTeamEvent extends Equatable {
  const FantasyTeamEvent();
}

class LoadFantasyTeams extends FantasyTeamEvent {
  @override
  List<Object> get props => [];
}
