import 'package:asp/asp.dart';
import 'package:things_stuff_client/src/features/things/interactor/atoms/things_atom.dart';
import 'package:things_stuff_client/src/features/things/interactor/service/crud_service.dart';

class ThingsReducer extends Reducer {
  final CRUDService service;

  ThingsReducer(this.service) {
    on(() => [getThings], () {});
  }
}
