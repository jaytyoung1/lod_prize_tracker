import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:lod_prize_tracker/domain/fantasy_team/fantasy_team.dart';
import 'package:meta/meta.dart';

part 'fantasy_team_event.dart';
part 'fantasy_team_state.dart';

@injectable
class FantasyTeamBloc extends Bloc<FantasyTeamEvent, FantasyTeamState> {
  FantasyTeamBloc({
    required this.fantasyTeamRepository,
  }) : super(const FantasyTeamStateInitial()) {
    on<LoadFantasyTeams>((event, emit) => loadFantasyTeamsToState(event, emit));
  }

  final IFantasyTeamRepository fantasyTeamRepository;

  FutureOr<void> loadFantasyTeamsToState(
    LoadFantasyTeams event,
    Emitter<FantasyTeamState> emit,
  ) async {
    List<FantasyTeam> fantasyTeamsRanked =
        await fantasyTeamRepository.getFantasyTeamsRanked(year: event.year);

    List<FantasyTeam> fantasyTeamsPointsFor =
        await fantasyTeamRepository.getPointsFor(year: event.year);

    List<FantasyTeam> fantasyTeamsPointsAllowed =
        await fantasyTeamRepository.getPointsAllowed(year: event.year);

    emit(FantasyTeamStateLoaded(
      fantasyTeamsRanked: fantasyTeamsRanked,
      fantasyTeamsPointsFor: fantasyTeamsPointsFor,
      fantasyTeamsPointsAllowed: fantasyTeamsPointsAllowed,
      year: event.year,
    ));
  }
}
