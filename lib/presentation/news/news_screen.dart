import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/news_bloc/list_news_bloc/news_cubit.dart';
import 'package:star_wars_front/presentation/components/container.dart';
import 'package:star_wars_front/presentation/components/top_bar.dart';

import 'list_news/list_news_items.dart';

class NewsScreenPage extends StatelessWidget {
  const NewsScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
      if (state is NewsStateNothing) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        );
      } else if (state is NewsStateLoaded) {
        return Scaffold(
          body: Column(
            children: [
              const TopBar(
                title: 'Вселенная',
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: ContentContainer(
                  child: ListNewsItems(
                    news: state.news.news,
                  ),
                ),
              )),
            ],
          ),
        );
      } else {
        return const Scaffold(

            body: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ));
      }
    });
  }
}
