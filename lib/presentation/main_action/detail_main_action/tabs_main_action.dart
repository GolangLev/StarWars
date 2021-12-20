import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/auth_bloc/authorization/authorization_cubit.dart';
import 'package:star_wars_front/domain/bloc/auth_bloc/registration/registration_cubit.dart';
import 'package:star_wars_front/domain/bloc/decoration_bloc/decoration_bloc_cubit.dart';
import 'package:star_wars_front/domain/models/user.dart';
import 'package:star_wars_front/presentation/components/constructor_input.dart';

import 'widgets/password_input.dart';
import 'widgets/tab_title.dart';

class MainActionScreenPageBody extends StatefulWidget {
  const MainActionScreenPageBody({Key? key}) : super(key: key);

  @override
  _MainActionScreenPageBodyState createState() =>
      _MainActionScreenPageBodyState();
}

class _MainActionScreenPageBodyState extends State<MainActionScreenPageBody> {
  final nickNameController = TextEditingController();
  final sideController = TextEditingController();
  final rankController = TextEditingController();
  final colorSwordController = TextEditingController();
  final typeSwordController = TextEditingController();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  final authLoginController = TextEditingController();
  final authPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        return BlocBuilder<DecorationCubit, DecorationState>(
          builder: (decorationContext, decorationState) {
            return DefaultTabController(
              length: 3,
              child: BlocBuilder<AuthorizationCubit, AuthorizationState>(
                builder: (authContext, authState) {
                  return Column(
                    children: [
                      const TabBar(
                        unselectedLabelColor: Colors.grey,
                        labelColor: Color(0xFFE1AE39),
                        indicatorColor: Color(0xFFE1AE39),
                        labelPadding: EdgeInsets.all(0),
                        tabs: [
                          Tab(
                            child: TabBarTitle(
                              title: 'Авторизация',
                            ),
                          ),
                          Tab(
                            child: TabBarTitle(
                              title: 'Регистрация',
                            ),
                          ),
                          Tab(
                            child: TabBarTitle(
                              title: 'О приложении',
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            _bodyForAuthorization(
                                context: context, signInInput: authState.signInInput),
                            _bodyForRegistration(
                                context: context, user: state.user),
                            const Center(
                              child: Text('Функционал в разработке, About'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _bodyForAuthorization(
      {required BuildContext context, required SignInInput signInInput}) {
    return Padding(
      padding: const EdgeInsets.only(left: 36, right: 36, top: 40, bottom: 20),
      child: Column(
        children: [
          ..._buildAuthorizationTable(context),
          Expanded(child: Container()),
          _authButton(context, signInInput),
        ],
      ),
    );
  }

  Widget _authButton(BuildContext context, SignInInput signInInput) {
    return InkWell(
      onTap: () {

        SignInInput input = signInInput.copyWith(
          login: authLoginController.text,
          password: authPasswordController.text,
        );

        context
            .read<AuthorizationCubit>().signIn(input);
        _clearInputsAuth();
        Navigator.of(context).pushNamed('/home');
      },
      child: Container(
        width: 220,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFE1AE39),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Авторизоваться',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAuthorizationTable(BuildContext context) {
    return [
      ConstructorInput(
        label: "Введите логин",
        controller: authLoginController,
        message: 'Логин это ваше уникальное имя\nдля входа в систему',
      ),
      const SizedBox(height: 12),
      FormPasswordInput(
        label: "Введите пароль",
        controller: authPasswordController,
        isChecked: true,
      ),
    ];
  }

  List<Widget> _buildRegistrationTable(BuildContext context) {
    return [
      ConstructorInput(
        label: "Придумайте имя",
        controller: nickNameController,
        message: 'Например:\n\nЙода\nОби-Ван Кеноби',
      ),
      const SizedBox(height: 12),
      ConstructorInput(
        label: "Укажите вашу сторону",
        controller: sideController,
        message: 'Стороны:\n\nСветлая\nТемная',
      ),
      const SizedBox(height: 12),
      ConstructorInput(
        label: "Укажите ваш ранг",
        controller: rankController,
        message:
            'Джедаи:\n\nЮнлинг\nПадаван\nРыцарь Джедай\nМастер Джадеай\nМагистр Джедай\n\nСитхи:\n\nМиньон Ситхов\nАдепт Ситхов\nТемный рыцарь\nТемный мастер\nЛорд Ситх\nВладыка Ситх',
      ),
      const SizedBox(height: 12),
      ConstructorInput(
        label: "Укажите цвет меча",
        controller: colorSwordController,
        message: 'Цвет:\n\nФиолетовый\nЗелёный\nСиний\nКрасный',
      ),
      const SizedBox(height: 12),
      ConstructorInput(
        label: "Укажите тип меча",
        controller: typeSwordController,
        message: 'Тип:\n\nОдноручный меч\nДвух клинковый меч',
      ),
      const SizedBox(height: 12),
      ConstructorInput(
        label: "Придумайте логин",
        controller: loginController,
        message: 'Логин это ваше уникальное имя\nдля входа в систему',
      ),
      const SizedBox(height: 12),
      FormPasswordInput(
        label: "Придумайте пароль",
        controller: passwordController,
        isChecked: true,
      ),
    ];
  }

  Widget _saveButton(BuildContext context, User user) {
    return InkWell(
      onTap: () {
        User newUser = user.copyWith(
          side: sideController.text,
          nickName: nickNameController.text,
          rank: rankController.text,
          colorSword: colorSwordController.text,
          typeSword: typeSwordController.text,
          login: loginController.text,
          password: passwordController.text,
        );
        context.read<RegistrationCubit>().signUp(newUser);
        _clearInputs();
      },
      child: Container(
        width: 220,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFE1AE39),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Зарегистрироваться',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _bodyForRegistration(
      {required BuildContext context, required User user}) {
    return Padding(
      padding: const EdgeInsets.only(left: 36, right: 36, top: 40, bottom: 20),
      child: Column(
        children: [
          ..._buildRegistrationTable(context),
          Expanded(child: Container()),
          _saveButton(context, user),
        ],
      ),
    );
  }

  void _clearInputs() {
    sideController.clear();
    nickNameController.clear();
    rankController.clear();
    colorSwordController.clear();
    typeSwordController.clear();
    loginController.clear();
    passwordController.clear();
  }

  void _clearInputsAuth(){
    authLoginController.clear();
    authPasswordController.clear();
  }
}
