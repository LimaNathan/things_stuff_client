import 'package:things_stuff_client/src/features/things/interactor/dto/thing_dto.dart';

sealed class ThingsState {}

class InitThing implements ThingsState {}

class LoadingThings implements ThingsState {}

class ShowingThings implements ThingsState {
  final List<ThingDTO> things;
  ShowingThings(this.things);
}
