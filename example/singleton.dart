import 'package:di_container/di_container.dart';

import 'base.dart';

void main(List<String> args) {
  final services = ServicesCollection() //
      .addSingleton((_) => ServiceA())
      .build();

  final service = services.getOf<ServiceA>();

  service.foo();
}
