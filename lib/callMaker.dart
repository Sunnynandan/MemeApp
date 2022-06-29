import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/post.dart';

class callMaker {
  Future<Post?> getPost() async {
    var client = http.Client();
    const String ApiUrl = "https://meme-api.herokuapp.com/gimme";

    var uri = Uri.parse(ApiUrl);

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;

      return postFromJson(json);
    }
  }
}
