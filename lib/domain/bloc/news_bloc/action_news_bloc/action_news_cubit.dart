import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:star_wars_front/domain/models/news.dart';
import 'package:star_wars_front/domain/repository/news_repository.dart';

part 'action_news_state.dart';

class ActionNewsCubit extends Cubit<ActionNewsState> {
  final NewsRepository newsRepository;
  ActionNewsCubit({required this.newsRepository}) : super(ActionNewsState(news: News.createEmpty()));

  void createNews(News news) async {
    await newsRepository.createNews(news);
  }

  void updateNews(int id, News news) async {
    await newsRepository.updateNews(id, news);
  }
}
