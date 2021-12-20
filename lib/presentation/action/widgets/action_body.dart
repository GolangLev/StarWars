import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/news_bloc/list_news_bloc/news_cubit.dart';

import 'list_news/list_news_items.dart';

class ActionBody extends StatelessWidget {
  const ActionBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          const TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Color(0xFFE1AE39),
            indicatorColor: Color(0xFFE1AE39),
            labelPadding: EdgeInsets.all(0),
            tabs: [
              Tab(
                text: 'Вселенная',
              ),
              Tab(
                text: 'Фильмы',
              ),
              Tab(
                text: 'Игры',
              ),
              Tab(
                text: 'Герои',
              ),
              Tab(
                text: 'Фракции',
              )
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                BlocBuilder<NewsCubit, NewsState>(
                  builder: (context, state) {
                    if (state is NewsStateNothing) {
                      return Column(
                        children: const [
                          SizedBox(height: 10),
                          Align(alignment: Alignment.topRight, child: ActionCreateNews()),
                          Expanded(
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else if (state is NewsStateLoaded) {
                      return Column(
                        children: [
                          const SizedBox(height: 10),
                          const Align(alignment: Alignment.topRight, child: ActionCreateNews()),
                          Expanded(
                            child: ActionListNews(news: state.news.news)
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.redAccent,
                        ),
                      );
                    }
                  },
                ),
                Center(
                  child: Text('Функционал в разработке, About'),
                ),
                Center(
                  child: Text('Функционал в разработке, About'),
                ),
                Center(
                  child: Text('Функционал в разработке, About'),
                ),
                Center(
                  child: Text('Функционал в разработке, About'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
