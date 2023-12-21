import 'package:dinjection/dinjection.dart';

import 'base.dart';

void main(List<String> args) {
  final services = ServicesCollection() //
      .addSingleton((_) => ServiceA())
      .build();

  final service = services.getOf<ServiceA>();

  service.foo();
}
