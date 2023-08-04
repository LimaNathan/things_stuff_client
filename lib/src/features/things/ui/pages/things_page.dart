// ignore_for_file: unnecessary_lambdas

import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:things_stuff_client/src/features/auth/interactor/atoms/auth_atom.dart';
import 'package:things_stuff_client/src/features/things/interactor/atoms/things_atom.dart';
import 'package:things_stuff_client/src/features/things/interactor/states/things_states.dart';
import 'package:things_stuff_client/src/features/things/ui/components/add_thing_form_widget.dart';
import 'package:things_stuff_client/src/features/things/ui/components/things_card.dart';

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

    Widget showingThings(ShowingThings state) => RefreshIndicator(
          onRefresh: () async {
            getThingsAction.call();
          },
          child: ListView.builder(
            itemCount: state.things.length,
            itemBuilder: (context, index) => ThingsCard(index: index),
          ),
        );

    Widget loading(LoadingThings state) => const Center(
          child: CircularProgressIndicator(),
        );

    Widget thingsError(ThingsErrorState state) => Center(
          child: Text(
            state.message ?? 'Houve um erro ao processar as requisições',
          ),
        );

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
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nova "coisa"'),
        icon: const Icon(Icons.plus_one),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const AddThingFormWidget();
            },
          );
        },
      ),
      body: state.when(
        init: Container.new,
        showingThings: showingThings,
        loading: loading,
        thingsError: thingsError,
      ),
    );
  }
}
