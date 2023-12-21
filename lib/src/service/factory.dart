import 'package:di_container/di_container.dart';

typedef ServiceFactory<T> = T Function(ServiceProvider services);
