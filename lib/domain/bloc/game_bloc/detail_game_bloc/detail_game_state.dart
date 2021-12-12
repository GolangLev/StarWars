part of 'detail_game_cubit.dart';

abstract class DetailGameState extends Equatable {
  const DetailGameState();
}

class DetailStateNothing extends DetailGameState {
  @override
  List<Object> get props => [];
}

class DetailStateLoaded extends DetailGameState {
  final ResponseGame responseGame;

  const DetailStateLoaded({required this.responseGame});

  @override
  List<Object> get props => [responseGame];
}
