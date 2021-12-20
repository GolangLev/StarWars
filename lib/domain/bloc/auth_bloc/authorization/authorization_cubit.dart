import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:star_wars_front/domain/models/user.dart';
import 'package:star_wars_front/domain/repository/user_repository.dart';

part 'authorization_state.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  AuthorizationCubit({required this.userRepository})
      : super(AuthorizationState(responseAuthUser: ResponseAuthUser.createEmpty(),
            signInInput: SignInInput.createEmpty()));

  final logger = Logger();

  final UserRepository userRepository;

  void signIn(SignInInput signInInput) async {
    final ResponseAuthUser authUser = await userRepository.signIn(signInInput);
    emit(AuthorizationState(
        responseAuthUser: authUser, signInInput: SignInInput.createEmpty()));
  }
}
