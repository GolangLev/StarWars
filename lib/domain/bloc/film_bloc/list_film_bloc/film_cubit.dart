import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:star_wars_front/domain/models/films.dart';
import 'package:star_wars_front/domain/repository/film_repository.dart';

part 'film_state.dart';

class FilmCubit extends Cubit<FilmState> {
  FilmCubit({required this.filmRepository}) : super(FilmStateNothing());

  final FilmRepository filmRepository;

  void getAllFilms() async {
    emit(FilmStateNothing());
    final film = await filmRepository.getAllFilms();
    emit(FilmStateLoaded(film: film));
  }
}
