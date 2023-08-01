import 'package:things_stuff_client/src/core/service/api_service.dart';
import 'package:things_stuff_client/src/features/things/interactor/dto/thing_dto.dart';
import 'package:things_stuff_client/src/features/things/interactor/service/crud_service.dart';
import 'package:things_stuff_client/src/features/things/interactor/states/things_states.dart';
import 'package:things_stuff_client/src/shared/utils/endpoints.dart';
import 'package:uno/uno.dart';

class ThingsCrudServiceImpl extends CRUDService {
  final ApiService api;

  ThingsCrudServiceImpl(this.api);
  @override
  Future<ThingsState> createNewThing(ThingDTO dto) async {
    final Response response = await api.post(
      Endpoints.createNewThing,
      body: dto.toMap(),
    );
    if (response.status == 201) {
      return CreatedThing(ThingDTO.fromJson(response.data));
    } else {
      return NotCreatedThing('Não foi possível criar o tipo');
    }
  }

  @override
  Future<ThingsState> deleteThing(int id) {
    throw UnimplementedError();
  }

  @override
  Future<ThingsState> getThings() {
    throw UnimplementedError();
  }

  @override
  Future<ThingsState> updateThing(ThingDTO dto) {
    throw UnimplementedError();
  }
}
