part of 'authorization_cubit.dart';

class AuthorizationState extends Equatable {
  final ResponseAuthUser responseAuthUser;
  final SignInInput signInInput;

  const AuthorizationState({required this.responseAuthUser, required this.signInInput});

  @override
  List<Object?> get props => [responseAuthUser, signInInput];
}
