part of 'detail_film_cubit.dart';

abstract class DetailFilmState extends Equatable {
  const DetailFilmState();
}

class DetailStateNothing extends DetailFilmState {
  @override
  List<Object> get props => [];
}

class DetailStateLoaded extends DetailFilmState {
  final ResponseFilm responseFilm;

  const DetailStateLoaded({required this.responseFilm});

  @override
  List<Object> get props => [responseFilm];
}
