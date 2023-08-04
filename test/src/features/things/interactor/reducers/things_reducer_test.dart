import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:things_stuff_client/src/features/things/interactor/atoms/things_atom.dart';
import 'package:things_stuff_client/src/features/things/interactor/dto/thing_dto.dart';
import 'package:things_stuff_client/src/features/things/interactor/reducers/things_reducer.dart';
import 'package:things_stuff_client/src/features/things/interactor/service/crud_service.dart';
import 'package:things_stuff_client/src/features/things/interactor/states/things_states.dart';

class CRUDServiceMock extends Mock implements CRUDService {}

void main() {
  final service = CRUDServiceMock();
  final reducer = ThingsReducer(service);

  tearDown(() => reset(service));

  tearDownAll(reducer.dispose);

  group(
    'things tests | ',
    () {
      test(
        'List of things',
        () {
          final showThings = ShowingThings([ThingDTO()]);

          when(service.getAll).thenAnswer((_) async => showThings);

          expect(
            thingState.buffer(2),
            completion(
              [isA<LoadingThings>(), showThings],
            ),
          );
          getThingsAction();
        },
      );
     },
  );
}
