import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:posts_api/core/constants.dart';
import 'package:posts_api/post_model/post_model.dart';

class ApiServices {
  // https://jsonplaceholder.typicode.com/posts

  //1) parse url from string to Uri
  //2) get response using http.get
  //3) check if status code is 200 okkk
  //4) decode response body from string to json (jsonDecode)
  //5) return list of postModel form jsonModel

  static Future<List<PostModel>?> getPosts() async {
    final url = Uri.parse(ApiConstants.baseUrl + ApiConstants.posts);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonModel = json.decode(response.body) as List;

      // list of map
      List<PostModel> posts = jsonModel.map((e) {
        return PostModel.fromJson(e);
      }).toList();

      return posts;
    }
    return null;
  }
}
