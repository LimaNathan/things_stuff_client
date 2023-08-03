// ignore_for_file: unnecessary_lambdas

import 'package:things_stuff_client/src/core/service/api_service.dart';
import 'package:things_stuff_client/src/features/things/interactor/dto/thing_dto.dart';
import 'package:things_stuff_client/src/features/things/interactor/service/crud_service.dart';
import 'package:things_stuff_client/src/features/things/interactor/states/things_states.dart';
import 'package:things_stuff_client/src/shared/utils/endpoints.dart';
import 'package:uno/uno.dart';

class ThingsCRUD extends CRUDService<ThingsState, ThingDTO> {
  final ApiService api;

  ThingsCRUD(this.api);
  @override
  Future<ThingsState> createNew(ThingDTO dto) async {
    try {
      final Response response = await api.post(
        Endpoints.createNewThing,
        body: dto.toMap(),
      );
      return CreatedThing(ThingDTO.fromJson(response.data));
    } catch (e) {
      return NotCreatedThing('Não foi possível criar o tipo');
    }
  }

  @override
  Future<ThingsState> delete(int id) async {
    try {
      await api.delete(Endpoints.deleteThingByID, id: id);
      return DeleteThingSuccess();
    } catch (e) {
      return ThingsErrorState();
    }
  }

  @override
  Future<ThingsState> getAll() async {
    try {
      final Response response = await api.get(Endpoints.getAllThings);

      if (response.data == null) {
        return ThingsErrorState(
          'Nenhuma "coisa" cadastrada',
        );
      }
      final things = (response.data as List)
          .map(
            (e) => ThingDTO.fromMap(e),
          )
          .toList();

      return ShowingThings(things);
    } catch (e) {
      return ThingsErrorState(e.toString());
    }
  }

  @override
  Future<ThingsState> getUnique(int id) async {
    try {
      final Response response =
          await api.get(Endpoints.getThingByID, queryParams: {'id': id});

      return ShowingOneThing(ThingDTO.fromMap(response.data));
    } catch (e) {
      return ThingsErrorState();
    }
  }

  @override
  Future<ThingsState> update(ThingDTO dto) async {
    try {
      final Response response = await api.update(Endpoints.updateThingByID);
      return CreatedThing(ThingDTO.fromMap(response.data));
    } catch (e) {
      return ThingsErrorState();
    }
  }
}
