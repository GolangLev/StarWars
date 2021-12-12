import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:star_wars_front/domain/models/heroes.dart';
import 'package:star_wars_front/domain/repository/hero_repository.dart';

part 'detail_hero_state.dart';

class DetailHeroCubit extends Cubit<DetailHeroState> {
  DetailHeroCubit({required this.heroRepository}) : super(DetailStateNothing());

  final HeroRepository heroRepository;

  void getHeroById(int id) async {
    emit(DetailStateNothing());
    final hero = await heroRepository.getHeroById(id);
    emit(DetailStateLoaded(responseHero: hero));
  }
}
