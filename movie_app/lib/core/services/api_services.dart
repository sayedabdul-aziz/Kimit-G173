import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/features/auth/data/models/movie_model.dart';

class ApiServices {
  // get popular movies

  static Future<MovieModel?> getPopularMovies() async {
    try {
      var res = await Dio().get('$kBaseUrl$kPopularEndpoint',
          queryParameters: {
            // language=en-US&page=1
            'language': 'en-US',
            'page': 1
          },
          options: Options(headers: {
            'Authorization': 'Bearer $kApiKey',
          }));

      if (res.statusCode == 200) {
        return MovieModel.fromJson(res.data);
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return null;
  }
}
