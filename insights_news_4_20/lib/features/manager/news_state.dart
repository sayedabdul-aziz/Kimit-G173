import 'package:insights_news_4_20/features/model/news_model/news_model.dart';

class NewsStates {}

class NewsInitialState extends NewsStates {}

// get News by category

class GetNewsByCategoryLoadingState extends NewsStates {}

class GetNewsByCategorySuccessState extends NewsStates {
  final NewsModel newsModel;
  GetNewsByCategorySuccessState({required this.newsModel});
}

class GetNewsByCategoryErrorState extends NewsStates {
  final String error;
  GetNewsByCategoryErrorState({required this.error});
}

// get News by search

class GetNewsBySearchLoadingState extends NewsStates {}

class GetNewsBySearchSuccessState extends NewsStates {
  final NewsModel newsModel;
  GetNewsBySearchSuccessState({required this.newsModel});
}

class GetNewsBySearchErrorState extends NewsStates {
  final String error;
  GetNewsBySearchErrorState({required this.error});
}
