import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:star_wars_front/domain/models/user.dart';
import 'package:star_wars_front/domain/repository/user_repository.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit({required this.userRepository}) : super(RegistrationState(user: User.createEmpty()));

  final UserRepository userRepository;

  void signUp(User user) async {
    await userRepository.signUp(user);
  }
}
