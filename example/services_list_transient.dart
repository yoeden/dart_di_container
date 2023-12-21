import 'package:di_container/di_container.dart';

import 'base.dart';

void main() {
  final services = ServicesCollection() //
      .base<BaseServiceA>((base) => base //
          .add((services) => ServiceA())
          .add((services) => ServiceB()))
      .build();

  final base = services.getManyOf<BaseServiceA>();

  for (var b in base) {
    b.foo();
  }
}
