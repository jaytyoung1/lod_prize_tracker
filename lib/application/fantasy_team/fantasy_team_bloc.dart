import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:lod_prize_tracker/domain/fantasy_team/fantasy_team.dart';

part 'fantasy_team_event.dart';
part 'fantasy_team_state.dart';

@injectable
class FantasyTeamBloc extends Bloc<FantasyTeamEvent, FantasyTeamState> {
  FantasyTeamBloc({
    required this.fantasyTeamRepository,
  }) : super(const FantasyTeamStateInitial()) {
    on<LoadFantasyTeams>((event, emit) => loadFantasyTeamsToState(emit));
  }

  final IFantasyTeamRepository fantasyTeamRepository;

  FutureOr<void> loadFantasyTeamsToState(
    Emitter<FantasyTeamState> emit,
  ) async {
    emit(const FantasyTeamStateLoading());

    List<FantasyTeam> fantasyTeamsRanked =
        await fantasyTeamRepository.getFantasyTeamsRanked();

    List<FantasyTeam> fantasyTeamsPointsFor =
        await fantasyTeamRepository.getPointsFor();

    List<FantasyTeam> fantasyTeamsPointsAllowed =
        await fantasyTeamRepository.getPointsAllowed();

    emit(FantasyTeamStateLoaded(
      fantasyTeamsRanked: fantasyTeamsRanked,
      fantasyTeamsPointsFor: fantasyTeamsPointsFor,
      fantasyTeamsPointsAllowed: fantasyTeamsPointsAllowed,
    ));
  }
}
