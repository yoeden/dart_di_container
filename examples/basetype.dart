import 'package:di_container/services.dart';

import 'base.dart';

void main(List<String> args) {
  final services = ServicesCollection() //
      .base<BaseServiceA>((base) => base.add((services) => ServiceA()))
      .build();

  final service = services.getOf<BaseServiceA>();

  service.foo();
}
