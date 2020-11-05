import 'package:http/http.dart' as http;
import 'dart:convert';

class ChuckNorrisAPI {
  static Future<String> fetchJoke(http.Client client) async {
    final response =
        await client.get('http://api.icndb.com/jokes/random?escape=javascript');

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json["value"]["joke"];
    } else {
      throw Exception('Failed to load joke');
    }
  }
}
