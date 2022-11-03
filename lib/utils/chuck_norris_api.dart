import 'package:http/http.dart' as http;
import 'dart:convert';

class ChuckNorrisAPI {
  static Future<String> fetchJoke(http.Client client) async {
    var url =
        Uri.parse('https://api.chucknorris.io/jokes/random?category=dev');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json["value"];
    } else {
      throw Exception('Failed to load joke');
    }
  }
}
