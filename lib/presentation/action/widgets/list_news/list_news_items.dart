import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/models/news.dart';
import 'package:star_wars_front/presentation/action/widgets/list_news/list_news_item/list_news_item.dart';
import 'package:star_wars_front/presentation/action/widgets/modal_window/modal_create_news.dart';

class ActionListNews extends StatelessWidget {
  final List<News> news;

  const ActionListNews({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ActionListItemNews> list = [];

    for (var item in news) {
      list.add(ActionListItemNews(
        news: item,
      ));
    }

    return Container(
      width: double.infinity,
      height: 72,
      padding: const EdgeInsets.all(5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...list,
          ],
        ),
      ),
    );
  }
}

class ActionCreateNews extends StatelessWidget {
  const ActionCreateNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(context: context, barrierDismissible: false, builder: (context){
          return const AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.all(0),
            insetPadding: EdgeInsets.all(0),
            backgroundColor: Color(0xFF36393f),
            content: ModalWindowCreateNews(),
          );
        });
      },
      child: Container(
        width: 250,
        height: 48,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Row(
            children: const [
              Icon(Icons.add, color: Colors.white),
              SizedBox(width: 20),
              Text(
                'Создать запись',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
