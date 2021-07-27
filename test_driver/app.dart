import 'package:flutter_driver/driver_extension.dart';
import 'package:chuck_norris_jokes/main.dart' as app;
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:chuck_norris_jokes/config/globals.dart' as globals;

class MockClient extends Mock implements http.Client {}

void main() {
  // This line enables the extension.
  enableFlutterDriverExtension();

  final MockClient client = MockClient();

  final fakeJokeAPIData =
      '{ "type": "success", "value": { "id": 461, "joke": "Chuck Norris finished World of Warcraft.", "categories": ["nerdy"] } }';
  var url = Uri.parse(
      'http://api.icndb.com/jokes/random?escape=javascript&exclude=[explicit]');
  when(client.get(url))
      .thenAnswer((_) async => http.Response(fakeJokeAPIData, 200));

  globals.httpClient = client;
  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  app.main();
}
