part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class ListNewsStarted extends NewsEvent {
  @override
  List<Object?> get props => [];
}
