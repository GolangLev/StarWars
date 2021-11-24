part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class ListNewsLoading extends NewsState {
  @override
  List<Object> get props => [];
}

class ListNewsLoaded extends NewsState {
  const ListNewsLoaded({required this.news});

  final news;

  @override
  List<Object> get props => [news];
}

class ListNewsError extends NewsState {
  @override
  List<Object> get props => [];
}
