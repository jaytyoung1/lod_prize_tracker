part of 'fantasy_team_bloc.dart';

abstract class FantasyTeamEvent extends Equatable {
  const FantasyTeamEvent();

  @override
  List<Object> get props => [];
}

class LoadFantasyTeams extends FantasyTeamEvent {
  final String year;

  const LoadFantasyTeams({required this.year});

  @override
  List<Object> get props => [year];
}
