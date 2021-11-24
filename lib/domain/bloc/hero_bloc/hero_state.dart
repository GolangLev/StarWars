part of 'hero_bloc.dart';

abstract class HeroState extends Equatable {
  const HeroState();
}

class ListHeroLoading extends HeroState {
  @override
  List<Object> get props => [];
}

class ListHeroLoaded extends HeroState {
  const ListHeroLoaded({required this.hero});

  final hero;

  @override
  List<Object> get props => [hero];
}

class ListHeroError extends HeroState {
  @override
  List<Object> get props => [];
}
