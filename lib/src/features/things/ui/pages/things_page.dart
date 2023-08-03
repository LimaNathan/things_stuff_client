// ignore_for_file: unnecessary_lambdas

import 'dart:developer';

import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:things_stuff_client/src/features/auth/interactor/atoms/auth_atom.dart';
import 'package:things_stuff_client/src/features/things/interactor/atoms/things_atom.dart';
import 'package:things_stuff_client/src/features/things/interactor/states/things_states.dart';

class ThingsPage extends StatefulWidget {
  const ThingsPage({super.key});

  @override
  State<ThingsPage> createState() => _ThingsPageState();
}

class _ThingsPageState extends State<ThingsPage> {
  @override
  void initState() {
    super.initState();
    getThingsAction.call();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select(() => thingState.value);

    Widget showingThings(ShowingThings state) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Text(state.things[index].name ?? ''),
              ],
            ),
          );
        },
      );
    }

    Widget loading(LoadingThings state) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    Widget thingsError(ThingsErrorState state) {
      return const Center(
        child: Text('Houve um erro ao processar as requisições'),
      );
    }

    Widget init() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('InitState'),
            ElevatedButton(
              onPressed: () {
                log('apertou');
                getThingsAction.call();
              },
              child: const Text('Buscar "coisas"'),
            )
          ],
        ),
      );
    }

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 100),
            ListTile(
              title: const Text('Sair'),
              onTap: () {
                Navigator.pop(context);
                loggoutAction();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Things'),
      ),
      body: state.when(
        init: init,
        showingThings: showingThings,
        loading: loading,
        thingsError: thingsError,
      ),
    );
  }
}
