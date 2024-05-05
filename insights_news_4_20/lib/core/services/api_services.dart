import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:insights_news_4_20/core/constants/app_constants.dart';
import 'package:insights_news_4_20/features/model/news_model/news_model.dart';

// Restful Api
// status Code
// postman
class ApiServices {
  static Future<NewsModel?> getNewsByCategory(String category) async {
    try {
      // var url = Uri.parse('');
      var res = await Dio().post(
        '${AppConstants.baseUrl}${AppConstants.topHedlines}?category=$category&country=us&apiKey=${AppConstants.apiKey}',
      );
      if (res.statusCode == 200) {
        // no decoding json.decode(res.body)
        return NewsModel.fromJson(res.data);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<NewsModel?> getNewsBySearch(String query) async {
    try {
      // var url = Uri.parse('');
      var res = await Dio().get(
          '${AppConstants.baseUrl}${AppConstants.topHedlines}?q=$query&country=us&apiKey=${AppConstants.apiKey}');
      if (res.statusCode == 200) {
        // no decoding json.decode(res.body)
        return NewsModel.fromJson(res.data);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
