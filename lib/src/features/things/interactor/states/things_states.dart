// ignore_for_file: prefer_final_locals

import 'package:things_stuff_client/src/features/things/interactor/dto/thing_dto.dart';

sealed class ThingsState {
  T when<T>({
    required T Function() init,
    T Function(LoadingThings state)? loading,
    T Function(ShowingThings state)? showingThings,
    T Function(ShowingOneThing state)? showingOne,
    T Function(CreatedThing state)? createdThing,
    T Function(ThingsErrorState state)? thingsError,
    T Function(DeleteThingSuccess state)? deleteThing,
    T Function(NotCreatedThing state)? notCreated,
  }) {
    return switch (this) {
      InitThing _ => init(),
      LoadingThings s => loading?.call(s) ?? init(),
      ShowingThings s => showingThings?.call(s) ?? init(),
      ShowingOneThing s => showingOne?.call(s) ?? init(),
      CreatedThing s => createdThing?.call(s) ?? init(),
      ThingsErrorState s => thingsError?.call(s) ?? init(),
      DeleteThingSuccess s => deleteThing?.call(s) ?? init(),
      NotCreatedThing s => notCreated?.call(s) ?? init(),
    };
  }
}

class InitThing extends ThingsState {}

class LoadingThings extends ThingsState {}

class ShowingThings extends ThingsState {
  final List<ThingDTO> things;
  ShowingThings(this.things);
}

class ShowingOneThing extends ThingsState {
  final ThingDTO thingDTO;
  ShowingOneThing(this.thingDTO);
}

class CreatedThing extends ThingsState {
  final ThingDTO dto;
  CreatedThing(this.dto);
}

class ThingsErrorState extends ThingsState {
  String? message;
  ThingsErrorState([this.message]);
}

class DeleteThingSuccess extends ThingsState {}

class NotCreatedThing extends ThingsState {
  final String message;
  NotCreatedThing(this.message);
}
