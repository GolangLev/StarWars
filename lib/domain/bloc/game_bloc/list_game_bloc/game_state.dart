part of 'game_cubit.dart';

abstract class GameState extends Equatable {
  const GameState();
}

class GameStateNothing extends GameState {
  @override
  List<Object?> get props => [];
}

class GameStateLoaded extends GameState {
  final ResponseGameAll game;

  const GameStateLoaded({
    required this.game,
  });

  @override
  List<Object?> get props => [game];
}
