import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/bloc/news_bloc/action_news_bloc/action_news_cubit.dart';
import 'package:star_wars_front/domain/bloc/news_bloc/list_news_bloc/news_cubit.dart';
import 'package:star_wars_front/domain/models/news.dart';
import 'package:star_wars_front/domain/repository/news_repository.dart';
import 'package:star_wars_front/presentation/components/constructor_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModalWindowCreateNews extends StatefulWidget {
  const ModalWindowCreateNews({Key? key}) : super(key: key);

  @override
  _ModalWindowCreateNewsState createState() => _ModalWindowCreateNewsState();
}

class _ModalWindowCreateNewsState extends State<ModalWindowCreateNews> {
  final titleController = TextEditingController();
  final subTitleController = TextEditingController();
  final descriptionController = TextEditingController();
  final NewsRepository newsRepository = NewsRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActionNewsCubit(newsRepository: newsRepository),
      child: BlocBuilder<ActionNewsCubit, ActionNewsState>(
        builder: (context, state) {
          return Container(
            width: 600,
            height: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFF36393f),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Создание записи для Вселенной',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 24,
                      color: Colors.white),
                ),
                const SizedBox(height: 15),
                ..._inputs(context),
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buttonSave(context, state.news),
                    const SizedBox(width: 10),
                    _buttonBack(context),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> _inputs(BuildContext context) {
    return [
      ConstructorInput(
        label: "Заголовок",
        message: "Заголовок статьи",
        controller: titleController,
        color: Colors.white,
      ),
      const SizedBox(height: 12),
      ConstructorInput(
        label: "Подзаголовок",
        message: "Подзаголовок статьи",
        controller: subTitleController,
        color: Colors.white,
      ),
      const SizedBox(height: 12),
      ConstructorInput(
        label: "Описание",
        message: "Описание статьи",
        controller: descriptionController,
        color: Colors.white,
      ),
    ];
  }

  Widget _buttonSave(BuildContext context, News news) {
    return InkWell(
      onTap: () {
        News newNews = news.copyWith(
            title: titleController.text,
            subTitle: subTitleController.text,
            description: descriptionController.text
        );
        context.read<ActionNewsCubit>().createNews(newNews);
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
            'Сохранить',
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

  Widget _buttonBack(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: 220,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFF735300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Назад',
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

  void _clearInputs() {
    titleController.clear();
    subTitleController.clear();
    descriptionController.clear();
  }
}
