import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/news_bloc/detail_news_bloc/detail_news_cubit.dart';
import 'package:star_wars_front/domain/models/news.dart';
import 'package:star_wars_front/presentation/components/detail_top_bar.dart';
import 'package:star_wars_front/presentation/news/detail_news/widgets/detail_news_body.dart';

class DetailNews extends StatelessWidget {
  final News news;

  const DetailNews({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailNewsCubit, DetailNewsState>(
      builder: (context, state) {
        if (state is DetailStateNothing) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is DetailStateLoaded) {
          return Scaffold(
            body: Column(
              children: [
                DetailTopBar(title: state.responseNews.news.displayTitle),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: DetailNewsBody(news: state.responseNews.news),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
      },
    );
  }
}
