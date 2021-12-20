import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:star_wars_front/domain/models/user.dart';
import 'package:star_wars_front/domain/repository/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;

  final logger = Logger();

  UserCubit({required this.userRepository}) : super(UserLoading());

  void getUserById(int userId) async {
    emit(UserLoading());
    final user = await userRepository.getUserById(userId);
    emit(UserLoaded(user: user));
  }
}
