part of 'fraction_cubit.dart';

abstract class FractionState extends Equatable {
  const FractionState();
}

class FractionStateNothing extends FractionState {
  @override
  List<Object?> get props => [];
}

class FractionStateLoaded extends FractionState {
  final ResponseFractionAll fraction;

  const FractionStateLoaded({
    required this.fraction,
  });

  @override
  List<Object?> get props => [fraction];
}
