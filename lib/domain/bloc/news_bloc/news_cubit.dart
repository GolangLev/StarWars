import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:star_wars_front/domain/models/news.dart';
import 'package:star_wars_front/domain/repository/news_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit({required this.newsRepository}) : super(NewsStateNothing());

  final NewsRepository newsRepository;

  void getAllNews() async {
    emit(NewsStateNothing());
    final news = await newsRepository.getAllNews();
    emit(NewsStateLoaded(news: news));
  }
}
