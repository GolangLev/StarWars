part of 'hero_bloc.dart';

abstract class HeroEvent extends Equatable {
  const HeroEvent();
}

class ListHeroStarted extends HeroEvent {
  @override
  List<Object?> get props => [];
}
