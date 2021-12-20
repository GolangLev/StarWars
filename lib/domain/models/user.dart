import 'package:equatable/equatable.dart';

/// # [User] class
/// модель имитирующая структуру User,
/// а также таблицу в базе данных Users
/// * [id] - номер записи в таблице
/// * [nickName] - имя пользователя(Йода, Дарт Вейдер)
/// * [side] - сторона, которую выбрал пользователь(светлая, темная)
/// * [rank] - звание, которое выбрал пользователь(магистр, рыцарь, падаван)
/// * [colorSword] - цвет светового меча(зелёный, синий, красный)
/// * [typeSword] - тип светового меча(одноручный, двуручный клинковый меч)
/// * [login] - уникальное имя пользователя, является уникальным полем для аутентификации
/// * [password] - поле которое для подтверждения данных при аутентификации
class User extends Equatable {
  final int id;
  final String nickName;
  final String side;
  final String rank;
  final String colorSword;
  final String typeSword;
  final String login;
  final String password;

  const User._({
    required this.id,
    required this.nickName,
    required this.side,
    required this.rank,
    required this.colorSword,
    required this.typeSword,
    required this.login,
    required this.password,
  });

  User copyWith({
    int? id,
    String? nickName,
    String? side,
    String? rank,
    String? colorSword,
    String? typeSword,
    String? login,
    String? password,
  }) {
    return User._(
      id: id ?? this.id,
      nickName: nickName ?? this.nickName,
      side: side ?? this.side,
      rank: rank ?? this.rank,
      colorSword: colorSword ?? this.colorSword,
      typeSword: typeSword ?? this.typeSword,
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [
        id,
        nickName,
        side,
        rank,
        colorSword,
        typeSword,
        login,
        password,
      ];

  /// # [User.fromJson(json)] метод
  /// метод для получения данных отправленных с сервера REST API
  User.fromJson(dynamic json)
      : id = json['id'],
        nickName = json['nick_name'],
        side = json['side'],
        rank = json['rank'],
        colorSword = json['color_sword'],
        typeSword = json['type_sword'],
        login = json['login'],
        password = json['password'];

  /// # [toJSON] метод для регистрации пользователей
  ///Для отправки данных в формате JSON (POST, PUT, DELETE)
  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['nick_name'] = nickName;
    json['side'] = side;
    json['rank'] = rank;
    json['color_sword'] = colorSword;
    json['type_sword'] = typeSword;
    json['login'] = login;
    json['password'] = password;

    return json;
  }

  factory User.createEmpty() {
    return const User._(
      id: 0,
      nickName: "",
      side: "",
      rank: "",
      colorSword: "",
      typeSword: "",
      login: "",
      password: "",
    );
  }
}

/// # [ResponseAuthUser] class
///модель имитирующая структуру ResponseAuthUser
/// * [id] - номер записи в таблице
/// * [token] - уникальный ключ в котором содержаться данные
class ResponseAuthUser extends Equatable {
  final int id;
  final String token;

  const ResponseAuthUser({required this.id, required this.token});

  @override
  List<Object?> get props => [id, token];

  factory ResponseAuthUser.createEmpty() {
    return const ResponseAuthUser(id: 0, token: "token");
  }

  ResponseAuthUser copyWith({
    int? id,
    String? token,
  }) {
    return ResponseAuthUser(id: id ?? this.id, token: token ?? this.token);
  }

  ResponseAuthUser.fromJson(dynamic json)
      : id = json['user_id'],
        token = json['token'];
}

/// # [SignInInput] class
/// модель имитирующая структуру SignInInput
/// * [login] - уникальное имя пользователя, является уникальным полем для аутентификации
/// * [password] - поле которое для подтверждения данных при аутентификации
class SignInInput extends Equatable {
  final String login;
  final String password;

  const SignInInput._({required this.login, required this.password});

  @override
  List<Object?> get props => [login, password];

  SignInInput copyWith({
    String? login,
    String? password,
  }) {
    return SignInInput._(
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  factory SignInInput.createEmpty() {
    return const SignInInput._(login: "", password: "");
  }

  /// # [toJSON]
  ///Для отправки данных в формате JSON (POST, PUT, DELETE)
  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};

    json['login'] = login;
    json['password'] = password;

    return json;
  }
}

/// ## [ResponseUser] class
/// для получения данных о конкретном пользователе из [User]
class ResponseUser extends Equatable {
  final User user;

  const ResponseUser({required this.user});

  ResponseUser.fromJson(dynamic json) : user = User.fromJson(json['User']);

  @override
  List<Object?> get props => [user];
}
