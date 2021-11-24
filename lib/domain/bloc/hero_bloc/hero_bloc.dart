import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:star_wars_front/domain/models/heroes.dart';
import 'package:star_wars_front/domain/repository/hero_repository.dart';

part 'hero_event.dart';
part 'hero_state.dart';

class HeroBloc extends Bloc<HeroEvent, HeroState> {
  HeroBloc({required this.heroRepository}) : super(ListHeroLoading()) {
    on<ListHeroStarted>(_onStarted);
  }

  final HeroRepository heroRepository;

  void _onStarted(ListHeroStarted event, Emitter<HeroState> emit) async {
    emit(ListHeroLoading());
    try {
      final ResponseHeroAll responseNewsAll = await heroRepository.getAllHeroes();
      emit(ListHeroLoaded(hero: responseNewsAll.hero));
    } catch (_) {
      emit(ListHeroError());
    }
  }
}
