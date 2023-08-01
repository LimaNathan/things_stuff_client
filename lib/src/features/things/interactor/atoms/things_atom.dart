import 'package:asp/asp.dart';
import 'package:things_stuff_client/src/features/things/interactor/dto/thing_dto.dart';
import 'package:things_stuff_client/src/features/things/interactor/states/things_states.dart';

///Atom
final thingState = Atom<ThingsState>(
  InitThing(),
  key: 'thingsState',
);

///Action

final getThingsAction = Atom.action(key: 'getThings');
final getOneThingAction = Atom<int?>(
  null,
  key: 'getOneThing',
);

final sendNewThingsAction = Atom<ThingDTO>(
  ThingDTO(),
  key: 'getThings',
);

final updateThingsAction = Atom<ThingDTO>(
  ThingDTO(),
  key: 'updateThings ',
);

final deleteThingAction = Atom<ThingDTO>(ThingDTO(), key: 'deleteThing');
