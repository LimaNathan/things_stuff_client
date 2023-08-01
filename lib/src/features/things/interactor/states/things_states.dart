import 'package:things_stuff_client/src/features/things/interactor/dto/thing_dto.dart';

sealed class ThingsState {}

class InitThing implements ThingsState {}

class LoadingThings implements ThingsState {}

class ShowingThings implements ThingsState {
  final List<ThingDTO> things;
  ShowingThings(this.things);
}

class CreatedThing implements ThingsState {
  final ThingDTO dto;
  CreatedThing(this.dto);
}

class NotCreatedThing implements ThingsState {
  final String message;
  NotCreatedThing(this.message);
}
