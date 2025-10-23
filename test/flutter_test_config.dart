import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  // This runs before any test in the entire project
  TestWidgetsFlutterBinding.ensureInitialized();

  // Set up test environment variables
  dotenv.load(
    mergeWith: {
      'POKEAPI_BASE_URL': 'https://test-api.example.com',
      // Add any other environment variables your tests might need
    },
  );

  // Run the actual tests
  await testMain();
}
