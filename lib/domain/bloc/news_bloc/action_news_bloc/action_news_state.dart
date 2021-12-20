part of 'action_news_cubit.dart';

class ActionNewsState extends Equatable {
  final News news;
  const ActionNewsState({required this.news});

  @override
  List<Object?> get props => [news];
}
