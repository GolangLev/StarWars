import 'package:star_wars_front/domain/models/user.dart';

/// ## [IRepoUser] abstract class(interface) набор методов для работы с базой данных
abstract class IRepoUser{
  Future signUp(User user);
  Future getUserById(int userId);
  Future signIn(SignInInput signInInput);
}