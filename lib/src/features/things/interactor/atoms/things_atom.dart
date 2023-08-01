import 'package:asp/asp.dart';
import 'package:things_stuff_client/src/features/things/interactor/dto/thing_dto.dart';
import 'package:things_stuff_client/src/features/things/interactor/states/things_states.dart';

///Atom
final atomState = Atom<ThingsState>(
  InitThing(),
  key: 'thingsState',
);

///Action

final getThings = Atom.action(key: 'getThings');
final sendNewThings = Atom<ThingDTO>(
  ThingDTO(),
  key: 'getThings',
);

final updateThings = Atom<ThingDTO>(
  ThingDTO(),
  key: 'updateThings ',
);

final deleteThing = Atom<ThingDTO>(ThingDTO(), key: 'deleteThing');
