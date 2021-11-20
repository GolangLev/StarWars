part of 'news_bloc.dart';

abstract class NewsState {}

class NewsEmptyState extends NewsState {}

class NewsLoadingState extends NewsState{}

class NewsLoadedState extends NewsState{
  List<dynamic> loadedNews;
  NewsLoadedState({required this.loadedNews});
}

class NewsErrorState extends NewsState{}


