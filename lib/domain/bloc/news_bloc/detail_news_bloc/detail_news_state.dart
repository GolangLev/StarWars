part of 'detail_news_cubit.dart';

abstract class DetailNewsState extends Equatable {
  const DetailNewsState();
}

class DetailStateNothing extends DetailNewsState {
  @override
  List<Object> get props => [];
}

class DetailStateLoaded extends DetailNewsState {
  final ResponseNews responseNews;

  const DetailStateLoaded({required this.responseNews});

  @override
  List<Object> get props => [responseNews];
}
