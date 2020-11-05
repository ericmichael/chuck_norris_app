import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:chuck_norris_jokes/utils/chuck_norris_api.dart';

// Create a MockClient using the Mock class provided by the Mockito package.
// Create new instances of this class in each test.
class MockClient extends Mock implements http.Client {}

main() {
  group('fetchJoke', () {
    test('returns a String if the http call completes successfully', () async {
      final client = MockClient();
      final fakeJokeAPIData =
          '{ "type": "success", "value": { "id": 461, "joke": "Chuck Norris finished World of Warcraft.", "categories": ["nerdy"] } }';
      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get('http://api.icndb.com/jokes/random?escape=javascript'))
          .thenAnswer((_) async => http.Response(fakeJokeAPIData, 200));

      //the extracted data from JSON
      String joke = await ChuckNorrisAPI.fetchJoke(client);

      //we extract a string so we expect a string
      expect(joke, isA<String>());

      //does the extracted value match our fake data?
      expect(joke, "Chuck Norris finished World of Warcraft.");
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get('http://api.icndb.com/jokes/random?escape=javascript'))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(ChuckNorrisAPI.fetchJoke(client), throwsException);
    });
  });
}
