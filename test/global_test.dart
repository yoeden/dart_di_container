import 'package:dinjection/dinjection.dart';
import 'package:test/test.dart';

void main() {
  group('Global service', () {
    test('when_services_isnot_set_as_global_should_throw', () {
      expect(() => gServices, throwsA(isA<Exception>()));
    });

    test('when_services_set_as_global_should_return', () {
      final localServices = ServicesCollection().build().setGlobal();

      expect(identical(gServices, localServices), true);
    });
  });
}
