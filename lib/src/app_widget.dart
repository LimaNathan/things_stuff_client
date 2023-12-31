import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:things_stuff_client/src/features/auth/interactor/atoms/auth_atom.dart';
import 'package:things_stuff_client/src/features/auth/interactor/states/auth_state.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();

    rxObserver(
      () => authState.value,
      effect: (state) {
        if (state is Unlogged) {
          Modular.to.navigate('/auth/login');
        } else if (state is Logged) {
          Modular.to.navigate('/things/');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/splash');
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
