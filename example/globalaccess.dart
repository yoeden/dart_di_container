import 'package:di_container/di_container.dart';

import 'base.dart';

void main(List<String> args) {
  final services = ServicesCollection() //
      .add((_) => ServiceA())
      .build()
      .setGlobal();

  functionWithNoParameters();
}

void functionWithNoParameters() {
  final service = gServices.getOf<ServiceA>();

  service.foo();
}
