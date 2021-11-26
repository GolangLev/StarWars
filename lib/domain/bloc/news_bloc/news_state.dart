part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsStateNothing extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsStateLoaded extends NewsState {
  final ResponseNewsAll news;

  const NewsStateLoaded({
    required this.news,
  });

  @override
  List<Object?> get props => [news];
}
