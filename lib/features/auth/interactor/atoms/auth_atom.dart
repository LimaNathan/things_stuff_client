import 'package:asp/asp.dart';
import 'package:things_stuff_client/features/auth/interactor/dto/email_credential_dto.dart';
import 'package:things_stuff_client/features/auth/interactor/states/auth_state.dart';

///Atom
final authState = Atom<AuthState>(
  InitAuth(),
  key: 'authState',
);

///Actions
final checkAuthAction = Atom.action(key: 'checkAuthAction');
final loginWithEmailAction = Atom<EmailCredentialDto>(
  EmailCredentialDto.empty(),
  key: 'loginWithEmail',
);

final loggoutAction = Atom.action(key: 'loggoutAction');
