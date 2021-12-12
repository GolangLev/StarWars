import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:star_wars_front/domain/models/games.dart';
import 'package:star_wars_front/domain/repository/game_repository.dart';

part 'detail_game_state.dart';

class DetailGameCubit extends Cubit<DetailGameState> {
  DetailGameCubit({required this.gameRepository}) : super(DetailStateNothing());

  final GameRepository gameRepository;

  void getGameById(int id) async {
    emit(DetailStateNothing());
    final game = await gameRepository.getGameById(id);
    emit(DetailStateLoaded(responseGame: game));
  }
}
