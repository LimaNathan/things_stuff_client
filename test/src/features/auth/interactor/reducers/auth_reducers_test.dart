import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:things_stuff_client/src/features/auth/interactor/atoms/auth_atom.dart';
import 'package:things_stuff_client/src/features/auth/interactor/entities/tokenization.dart';
import 'package:things_stuff_client/src/features/auth/interactor/reducers/auth_reducers.dart';
import 'package:things_stuff_client/src/features/auth/interactor/service/auth_service.dart';
import 'package:things_stuff_client/src/features/auth/interactor/states/auth_state.dart';

class AuthServiceMock extends Mock implements AuthService {}

void main() {
  final service = AuthServiceMock();
  final reducer = AuthReducers(service);

  tearDown(() => reset(service));

  tearDownAll(reducer.dispose);

  group(
    'check auth | ',
    () {
      test(
        'Logged',
        () {
          final logged = Logged(Tokenization(idToken: ''));
          when(service.checkAuth).thenAnswer((_) async => logged);

          expect(
            authState.buffer(2),
            completion(
              [isA<LoadingAuth>(), logged],
            ),
          );

          checkAuthAction();
        },
      );
    },
  );
}
