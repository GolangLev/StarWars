import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:star_wars_front/domain/models/news.dart';
import 'package:star_wars_front/domain/repository/news_repository.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({required this.newsRepository}) : super(ListNewsLoading()) {
    on<ListNewsStarted>(_onStarted);
  }

  final NewsRepository newsRepository;

  void _onStarted(ListNewsStarted event, Emitter<NewsState> emit) async {
    emit(ListNewsLoading());
    try {
      final ResponseNewsAll responseNewsAll = await newsRepository.getAllNews();
      emit(ListNewsLoaded(news: responseNewsAll.news));
    } catch (_) {
      emit(ListNewsError());
    }
  }
}
