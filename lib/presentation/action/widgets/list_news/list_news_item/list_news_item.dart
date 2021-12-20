import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/bloc/news_bloc/list_news_bloc/news_cubit.dart';
import 'package:star_wars_front/domain/models/news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionListItemNews extends StatelessWidget {
  final News news;

  const ActionListItemNews({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                '${news.id}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                news.displayTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit_outlined,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              IconButton(
                onPressed: () {
                  context.read<NewsCubit>().deleteNews(news.id);
                },
                icon: const Icon(
                  Icons.delete_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
