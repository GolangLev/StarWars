part of 'detail_hero_cubit.dart';

abstract class DetailHeroState extends Equatable {
  const DetailHeroState();
}

class DetailStateNothing extends DetailHeroState {
  @override
  List<Object> get props => [];
}

class DetailStateLoaded extends DetailHeroState {
  final ResponseHero responseHero;

  const DetailStateLoaded({required this.responseHero});

  @override
  List<Object> get props => [responseHero];
}
