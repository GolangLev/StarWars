import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:star_wars_front/domain/models/films.dart';
import 'package:star_wars_front/domain/repository/film_repository.dart';

part 'detail_film_state.dart';

class DetailFilmCubit extends Cubit<DetailFilmState> {
  DetailFilmCubit({required this.filmRepository}) : super(DetailStateNothing());

  final FilmRepository filmRepository;

  void getFilmById(int id) async{
    emit(DetailStateNothing());
    final film = await filmRepository.getFilmById(id);
    emit(DetailStateLoaded(responseFilm: film));
  }

}
