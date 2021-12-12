part of 'detail_fraction_cubit.dart';

abstract class DetailFractionState extends Equatable {
  const DetailFractionState();
}

class DetailStateNothing extends DetailFractionState {
  @override
  List<Object> get props => [];
}

class DetailStateLoaded extends DetailFractionState {
  final ResponseFraction responseFraction;

  const DetailStateLoaded({required this.responseFraction});

  @override
  List<Object> get props => [responseFraction];
}
