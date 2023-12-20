import 'package:di_container/services.dart';

import 'base.dart';

void main() {
  final services = ServicesCollection() //
      .base<BaseServiceA>((base) => base //
          .add((services) => ServiceA())
          .addSingleton((services) => ServiceB()))
      .build();

  final base = services.getManyOf<BaseServiceA>();

  for (var b in base) {
    b.foo();
  }
}
