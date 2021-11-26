import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:star_wars_front/domain/models/heroes.dart';
import 'package:star_wars_front/domain/repository/hero_repository.dart';

part 'hero_state.dart';

class HeroCubit extends Cubit<HeroState> {
  HeroCubit({required this.heroRepository}) : super(HeroStateNothing());

  final HeroRepository heroRepository;

  void getAllHeroes() async {
    emit(HeroStateNothing());
    final hero = await heroRepository.getAllHeroes();
    emit(HeroStateLoaded(hero: hero));
  }
}
