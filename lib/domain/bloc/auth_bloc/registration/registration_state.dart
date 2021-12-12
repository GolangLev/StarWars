part of 'registration_cubit.dart';

class RegistrationState extends Equatable {
  final User user;

  const RegistrationState({required this.user});

  @override
  List<Object?> get props => [user];
}
