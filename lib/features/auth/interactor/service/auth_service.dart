import 'package:things_stuff_client/features/auth/interactor/dto/email_credential_dto.dart';
import 'package:things_stuff_client/features/auth/interactor/states/auth_state.dart';

abstract class AuthService {
  Future<AuthState> loginWithEmail(EmailCredentialDto dto);
  Future<AuthState> loggout();
  Future<AuthState> checkAuth();
}
