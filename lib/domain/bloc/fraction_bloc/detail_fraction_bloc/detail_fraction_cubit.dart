import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:star_wars_front/domain/models/fractions.dart';
import 'package:star_wars_front/domain/repository/fraction_repository.dart';

part 'detail_fraction_state.dart';

class DetailFractionCubit extends Cubit<DetailFractionState> {
  DetailFractionCubit({required this.fractionRepository}) : super(DetailStateNothing());

  final FractionRepository fractionRepository;

  void getFractionById(int id) async{
    emit(DetailStateNothing());
    final fraction = await fractionRepository.getFractionById(id);
    emit(DetailStateLoaded(responseFraction: fraction));
  }
}
