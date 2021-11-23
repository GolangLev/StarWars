part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsLoading extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoaded extends NewsState{
  final List<News> news;

  const NewsLoaded({required this.news});
  @override
  List<Object?> get props => [];
}
