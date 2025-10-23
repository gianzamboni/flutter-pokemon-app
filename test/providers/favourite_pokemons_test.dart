import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokeapp/models/pokemon.dart';
import 'package:pokeapp/models/pokemon_types.dart';
import 'package:pokeapp/models/user.dart';
import 'package:pokeapp/models/user_session.dart';
import 'package:pokeapp/providers/favourite_pokemons.dart';
import 'package:mockito/annotations.dart';
import 'package:pokeapp/providers/services.dart';
import '../test_utils/service_manager_test.dart';

@GenerateNiceMocks([MockSpec<FavouritePokemonService>()])
import 'package:pokeapp/services/favrourite_pokemon_service.dart';

@GenerateNiceMocks([MockSpec<LocalStorageService>()])
import 'package:pokeapp/services/local_storage_service.dart';

import 'favourite_pokemons_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FavouritePokemonsNotifier Tests', () {
    group('states', () {
      test('if user is not authenticated, returns empty list', () async {
        final mockFavouritePokemonService = MockFavouritePokemonService();

        final container = ProviderContainer.test(
          overrides: [
            servicesProvider.overrideWith(
              (ref) => ServiceManagerTest(
                favouritePokemonService: mockFavouritePokemonService,
              ),
            ),
          ],
        );

        container.listen(favouritePokemonsProvider, (previous, next) {
          expect(next.value, isA<List<Pokemon>>());
          expect(next.value!.length, 0);
          verifyNever(mockFavouritePokemonService.getFavouritePokemons(any));
        });
      });
    });
  });
}
