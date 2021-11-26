import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:star_wars_front/domain/models/games.dart';
import 'package:star_wars_front/domain/repository/game_repository.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit({required this.gameRepository}) : super(GameStateNothing());

  final GameRepository gameRepository;

  void getAllGames() async {
    emit(GameStateNothing());
    final game = await gameRepository.getAllGames();
    emit(GameStateLoaded(game: game));
  }
}
