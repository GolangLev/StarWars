import 'package:bloc/bloc.dart';
import 'package:star_wars_front/domain/models/news.dart';
import 'package:star_wars_front/domain/repository/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;
  NewsBloc(this.newsRepository) : super(NewsEmptyState()) {

    Stream<NewsState> mapEventToState(NewsEvent event) async*{
      if (event is NewsLoad) {
        yield NewsLoadingState();
        try {
          final List<News> _loadedNewsList = await newsRepository.getAllNews();
          yield NewsLoadedState(loadedNews: _loadedNewsList);
        } catch (_) {
          yield NewsErrorState();
        }
      } else if (event is NewsClear) {
        yield NewsEmptyState();
      }
    }
  }
}
