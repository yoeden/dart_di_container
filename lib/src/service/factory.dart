import 'package:dinjection/dinjection.dart';

typedef ServiceFactory<T> = T Function(ServiceProvider services);
