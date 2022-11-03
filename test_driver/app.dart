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
      '{ "categories": ["dev"], "created_at": "2020-01-05 13:42:19.324003", "icon_url": "https://assets.chucknorris.host/img/avatar/chuck-norris.png", "id": "yrvjrpx3t4qxqmowpyvxbq","updated_at": "2020-01-05 13:42:19.324003", "url": "https://api.chucknorris.io/jokes/yrvjrpx3t4qxqmowpyvxbq", "value": "Chuck Norris knows the last digit of PI."}';
  var url = Uri.parse('https://api.chucknorris.io/jokes/random?category=dev');
  when(client.get(url))
      .thenAnswer((_) async => http.Response(fakeJokeAPIData, 200));

  globals.httpClient = client;
  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  app.main();
}
