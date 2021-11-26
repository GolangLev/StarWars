import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:star_wars_front/domain/models/fractions.dart';
import 'package:star_wars_front/domain/repository/fraction_repository.dart';

part 'fraction_state.dart';

class FractionCubit extends Cubit<FractionState> {
  FractionCubit({required this.fractionRepository}) : super(FractionStateNothing());

  final FractionRepository fractionRepository;

  void getAllFractions() async {
    emit(FractionStateNothing());
    final fraction = await fractionRepository.getAllFractions();
    emit(FractionStateLoaded(fraction: fraction));
  }
}
