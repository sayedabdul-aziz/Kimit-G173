import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news_4_20/core/services/api_services.dart';
import 'package:insights_news_4_20/features/manager/news_state.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  // late NewsModel model;

  // get News by category
  getNewsByCategory(String category) {
    emit(GetNewsByCategoryLoadingState());
    // data or no
    try {
      ApiServices.getNewsByCategory(category).then((value) {
        // model = value!;
        emit(GetNewsByCategorySuccessState(newsModel: value!));
      });
    } catch (e) {
      emit(GetNewsByCategoryErrorState(error: e.toString()));
    }
  }

  getNewsBySearch(String query) {
    emit(GetNewsBySearchLoadingState());
    // data or no
    try {
      ApiServices.getNewsBySearch(query).then((value) {
        // model = value!;
        emit(GetNewsBySearchSuccessState(newsModel: value!));
      });
    } catch (e) {
      emit(GetNewsBySearchErrorState(error: e.toString()));
    }
  }
}
