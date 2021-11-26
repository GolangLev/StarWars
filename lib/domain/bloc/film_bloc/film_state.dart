part of 'film_cubit.dart';

abstract class FilmState extends Equatable {
  const FilmState();
}

class FilmStateNothing extends FilmState {
  @override
  List<Object?> get props => [];
}

class FilmStateLoaded extends FilmState {
  final ResponseFilmsAll film;

  const FilmStateLoaded({
    required this.film,
  });

  @override
  List<Object?> get props => [film];
}