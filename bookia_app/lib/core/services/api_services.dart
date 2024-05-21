import 'package:bookia_app/core/constants/constants.dart';
import 'package:dio/dio.dart';

class ApiServices {
  static late Dio _dio;

  init() {
    _dio = Dio(BaseOptions(
      baseUrl: kBaseUrl,
    ));
  }

  static Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    var data,
  }) async {
    var res = await _dio.get(
      endPoint,
      queryParameters: query,
      data: data,
      options: Options(
        headers: headers,
      ),
    );

    return res.data;
  }

  static Future<dynamic> post({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    var data,
  }) async {
    var res = await _dio.post(
      endPoint,
      queryParameters: query,
      data: data,
      options: Options(
        headers: headers,
      ),
    );

    return res.data;
  }

  static Future<dynamic> delete({
    required String endPoint,
    Map<String, dynamic>? headers,
    var data,
    Map<String, dynamic>? query,
  }) async {
    var res = await _dio.delete(
      endPoint,
      queryParameters: query,
      data: data,
      options: Options(
        headers: headers,
      ),
    );

    return res.data;
  }

  static Future<dynamic> put({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    var data,
  }) async {
    var res = await _dio.put(
      endPoint,
      queryParameters: query,
      data: data,
      options: Options(
        headers: headers,
      ),
    );

    return res.data;
  }
}
