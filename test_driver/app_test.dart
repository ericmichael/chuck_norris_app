// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Chuck Norris Joke App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final jokeTextFinder = find.byValueKey('joke-text');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('tells joke', () async {
      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      expect(await driver.getText(jokeTextFinder),
          "Chuck Norris finished World of Warcraft.");
    });
  });
}
