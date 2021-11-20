part of 'news_bloc.dart';

abstract class NewsEvent {}

class NewsLoad extends NewsEvent{}

class NewsClear extends NewsEvent{}