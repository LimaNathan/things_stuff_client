import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:things_stuff_client/src/features/auth/interactor/atoms/auth_atom.dart';
import 'package:things_stuff_client/src/features/auth/interactor/dto/email_credential_dto.dart';
import 'package:things_stuff_client/src/features/auth/interactor/states/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  EmailCredentialDto dto = EmailCredentialDto();

  @override
  Widget build(BuildContext context) {
    final state = context.select(() => authState.value);

    final isLoading = state is LoadingAuth;
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Things',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * .2),
            TextFormField(
              enabled: !isLoading,
              onChanged: (value) => dto.email = value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'e-mail',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              enabled: !isLoading,
              onChanged: (value) => dto.password = value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'password',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  isLoading ? null : () => loginWithEmailAction.value = dto,
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
