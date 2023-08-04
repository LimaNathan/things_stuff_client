// ignore_for_file: unnecessary_lambdas

import 'dart:developer';

import 'package:asp/asp.dart';
import 'package:things_stuff_client/src/features/things/interactor/atoms/things_atom.dart';
import 'package:things_stuff_client/src/features/things/interactor/service/crud_service.dart';
import 'package:things_stuff_client/src/features/things/interactor/states/things_states.dart';

class ThingsReducer extends Reducer {
  final CRUDService service;

  ThingsReducer(this.service) {
    on(() => [getThingsAction], _getThings);
    on(() => [getOneThingAction], _getOneThing);
    on(() => [sendNewThingsAction], _sendNewThings);
    on(() => [updateThingsAction], _updateThings);
    on(() => [deleteThingAction], _deleteThing);
  }

  void _getThings() {
    log('aconteceu a action _getThings');
    thingState.value = LoadingThings();
    service.getAll().then((value) => thingState.setValue(value));
  }

  void _getOneThing() {
    log('aconteceu a action _getOneThing');

    thingState.value = LoadingThings();
    final id = getOneThingAction.value!;
    service.getUnique(id).then((value) => thingState.setValue(value));
  }

  void _sendNewThings() {
    log('aconteceu a action _sendNewThings');

    thingState.value = LoadingThings();
    final dto = sendNewThingsAction.value;
    service.createNew(dto).then((value) => _getThings());
  }

  void _updateThings() {
    log('aconteceu a action _updateThings');

    thingState.value = LoadingThings();
    final dto = updateThingsAction.value;
    service.update(dto).then((value) => thingState.setValue(value));
  }

  void _deleteThing() {
    log('aconteceu a action _deleteThing');

    thingState.value = LoadingThings();
    final id = deleteThingAction.value.id!;
    service.delete(id).then((value) => deleteThingAction.setValue(value));
  }
}
