import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:lod_prize_tracker/domain/fantasy_team/fantasy_team.dart';

part 'fantasy_team_event.dart';
part 'fantasy_team_state.dart';

@injectable
class FantasyTeamBloc extends Bloc<FantasyTeamEvent, FantasyTeamState> {
  FantasyTeamBloc({
    required IFantasyTeamRepository fantasyTeamRepository,
  })  : _fantasyTeamRepository = fantasyTeamRepository,
        super(const FantasyTeamStateInitial());

  final IFantasyTeamRepository _fantasyTeamRepository;

  @override
  Stream<FantasyTeamState> mapEventToState(FantasyTeamEvent event) async* {
    if (event is LoadFantasyTeams) {
      yield* _mapLoadFantasyTeamsToState();
    }
  }

  Stream<FantasyTeamState> _mapLoadFantasyTeamsToState() async* {
    yield FantasyTeamStateLoading();

    List<FantasyTeam> _fantasyTeams =
        await _fantasyTeamRepository.getFantasyTeamsRanked();

    yield FantasyTeamStateLoaded(fantasyTeams: _fantasyTeams);
  }
}
