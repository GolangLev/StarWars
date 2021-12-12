import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:star_wars_front/domain/models/news.dart';
import 'package:star_wars_front/domain/repository/news_repository.dart';

part 'detail_news_state.dart';

class DetailNewsCubit extends Cubit<DetailNewsState> {
  DetailNewsCubit({required this.newsRepository}) : super(DetailStateNothing());

  final NewsRepository newsRepository;

  void getNewsById(int id) async {
    emit(DetailStateNothing());
    final news = await newsRepository.getNewsById(id);
    emit(DetailStateLoaded(responseNews: news));
  }
}
