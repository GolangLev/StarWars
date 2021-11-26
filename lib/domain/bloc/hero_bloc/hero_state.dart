part of 'hero_cubit.dart';

abstract class HeroState extends Equatable {
  const HeroState();
}

class HeroStateNothing extends HeroState {
  @override
  List<Object?> get props => [];
}

class HeroStateLoaded extends HeroState {
  final ResponseHeroAll hero;

  const HeroStateLoaded({
    required this.hero,
  });

  @override
  List<Object?> get props => [hero];
}