import 'package:firebase_auth/firebase_auth.dart';
import 'package:things_stuff_client/features/auth/interactor/dto/email_credential_dto.dart';
import 'package:things_stuff_client/features/auth/interactor/entities/tokenization.dart';
import 'package:things_stuff_client/features/auth/interactor/service/auth_service.dart';
import 'package:things_stuff_client/features/auth/interactor/states/auth_state.dart';

class FirebaseAuthService extends AuthService {
  final FirebaseAuth firebase;

  FirebaseAuthService(this.firebase);
  @override
  Future<AuthState> checkAuth() async {
    final token = await firebase.currentUser?.getIdToken();
    if (token == null) {
      return Unlogged();
    } else {
      final tokenization = Tokenization(idToken: token);
      return Logged(tokenization);
    }
  }

  @override
  Future<AuthState> loggout() async {
    await firebase.signOut();
    return Unlogged();
  }

  @override
  Future<AuthState> loginWithEmail(EmailCredentialDto dto) async {
    try {
      await firebase.signInWithEmailAndPassword(
        email: dto.email,
        password: dto.password,
      );

      return checkAuth();
    } catch (e) {
      return Unlogged();
    }
  }
}
