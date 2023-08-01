import 'package:things_stuff_client/src/features/things/interactor/dto/thing_dto.dart';
import 'package:things_stuff_client/src/features/things/interactor/states/things_states.dart';

abstract class CRUDService {
  Future<ThingsState> getThings();
  Future<ThingsState> createNewThing(ThingDTO dto);
  Future<ThingsState> updateThing(ThingDTO dto);
  Future<ThingsState> deleteThing(int id);
}
