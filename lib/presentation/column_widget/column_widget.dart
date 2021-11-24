import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/hero_bloc/hero_bloc.dart';
import 'package:star_wars_front/domain/bloc/news_bloc/news_bloc.dart';
import 'package:star_wars_front/presentation/hero/widgets/list_hero_items.dart';
import 'package:star_wars_front/presentation/news/widgets/list_news_items.dart';

class ColumnWidgets extends StatelessWidget {
  const ColumnWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Star Wars'),
          centerTitle: true,
          backgroundColor: Colors.black,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            isScrollable: true,
            tabs: [
              Tab(child: Text('Новости'),),
              Tab(child: Text('Персонажи'),),
              Tab(child: Text('Игры'),),
              Tab(child: Text('Фильмы'),),
              Tab(child: Text('Фракции'),),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BlocBuilder<NewsBloc, NewsState>(
              builder: (context, newsState) {
                if(newsState is ListNewsLoading){
                  return const Center(child: CircularProgressIndicator());
                }else if(newsState is ListNewsLoaded){
                  return ListNewsItems(news: newsState.news);
                }else{
                  return const Center(child: Text('Error'),);
                }
              },
            ),
            BlocBuilder<HeroBloc, HeroState>(
              builder: (context, heroState) {
                if(heroState is ListHeroLoading){
                  return const Center(child: CircularProgressIndicator());
                }else if(heroState is ListHeroLoaded){
                  return ListHeroItems(hero: heroState.hero);
                }else{
                  return const Center(child: Text('Error'),);
                }
              },
            ),
            Icon(Icons.add, size: 90),
            Icon(Icons.add, size: 90),
            Icon(Icons.add, size: 90),
          ],
        ),
      ),
    );
  }
}
