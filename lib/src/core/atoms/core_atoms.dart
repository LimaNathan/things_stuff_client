import 'package:asp/asp.dart';
import 'package:things_stuff_client/src/core/exception/exceptions.dart';

final globalLoaderState = Atom(
  false,
  key: 'globalLoaderState',
);

final globalExceptionState = Atom<ThingsException?>(
  null,
  key: 'globalExceptionState',
  pipe: interval(const Duration(seconds: 1)),
);
