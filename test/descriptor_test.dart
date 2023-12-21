import 'package:di_container/di_container.dart';
import 'package:test/test.dart';

void main() {
  group('Service Descriptor', () {
    //final collection = ServicesCollection();

    setUp(() {
      // Additional setup goes here.
    });

    test('when_descriptor_created_should_contain_service', () {
      factory(_) => Impl1();
      final service = ServiceDescriptor.factory<Impl1>(factory, ServiceLifetime.transient);

      expect(service.implementationFactory, factory);
      expect(service.implementationType, null);
      expect(service.lifetime, ServiceLifetime.transient);
      expect(service.serviceType, Impl1);
    });

    test('when_singleton_descriptor_created_should_contain_service', () {
      factory(_) => Impl1();
      final service = ServiceDescriptor.factoryWithBase<Base, Impl1>(factory, ServiceLifetime.transient);

      expect(service.implementationFactory, factory);
      expect(service.implementationType, Impl1);
      expect(service.lifetime, ServiceLifetime.transient);
      expect(service.serviceType, Base);
    });
  });
}

//

abstract class Base {}

class Impl1 extends Base {}

class Impl2 extends Base {}

class DontRegisterService {}
