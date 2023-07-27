import 'package:asp/asp.dart';
import 'package:things_stuff_client/src/features/auth/interactor/atoms/auth_atom.dart';
import 'package:things_stuff_client/src/features/auth/interactor/service/auth_service.dart';
import 'package:things_stuff_client/src/features/auth/interactor/states/auth_state.dart';

class AuthReducers extends Reducer {
  final AuthService service;

  AuthReducers(this.service) {
    on(() => [checkAuthAction], _checkAuth);
    on(() => [loginWithEmailAction], _loginWithEmail);
    on(() => [loggoutAction], _loggout);
  }

  void _checkAuth() {
    authState.value = LoadingAuth();
    service.checkAuth().then(authState.setValue);
  }

  void _loginWithEmail() {
    authState.value = LoadingAuth();
    final dto = loginWithEmailAction.value;
    service.loginWithEmail(dto).then(authState.setValue);
  }

  void _loggout() {
    authState.value = LoadingAuth();
    service.loggout().then(authState.setValue);
  }
}
