import 'package:dinjection/dinjection.dart';
import 'package:test/test.dart';

import 'descriptor_test.dart';

void main() {
  group('Collection', () {
    //final collection = ServicesCollection();

    setUp(() {
      // Additional setup goes here.
    });

    tearDown(() {
      //
    });

    test('when_adding_transient_collection_should_contain_service', () {
      final factory = (_) => Impl1();
      final collection = ServicesCollection();
      collection.add<Impl1>(factory);

      expect(collection.services.length, 1);
      expect(collection.services[0].lifetime, ServiceLifetime.transient);
      expect(collection.services[0].implementationFactory, factory);
    });

    test('when_adding_multiple_transient_impls_with_base_collection_should_contain_services', () {
      final factory1 = (_) => Impl1();
      final factory2 = (_) => Impl2();
      final collection = ServicesCollection().base<Base>(
        (base) => base //
            .add(factory1)
            .add(factory2),
      );

      expect(collection.services.length, 2);

      expect(collection.services[0].lifetime, ServiceLifetime.transient);
      expect(collection.services[0].implementationFactory, factory1);

      expect(collection.services[1].lifetime, ServiceLifetime.transient);
      expect(collection.services[1].implementationFactory, factory2);
    });

    test('when_adding_transient_impls_with_base_collection_should_contain_service', () {
      final factory = (_) => Impl1();
      final collection = ServicesCollection().base<Base>(
        (base) => base //
            .add(factory),
      );

      expect(collection.services.length, 1);
      expect(collection.services[0].lifetime, ServiceLifetime.transient);
      expect(collection.services[0].implementationFactory, factory);
      expect(collection.services[0].serviceType, Base);
    });

    test('when_adding_singleton_collection_should_contain_service', () {
      final factory = (_) => Impl1();
      final collection = ServicesCollection();
      collection.addSingleton<Impl1>(factory);

      expect(collection.services.length, 1);
      expect(collection.services[0].lifetime, ServiceLifetime.singleton);
      expect(collection.services[0].implementationFactory, factory);
    });

    test('when_adding_multiple_singleton_impls_with_base_collection_should_contain_services', () {
      final factory1 = (_) => Impl1();
      final factory2 = (_) => Impl2();
      final collection = ServicesCollection();
      collection.base<Base>(
        (base) => base //
            .addSingleton(factory1)
            .addSingleton(factory2),
      );

      expect(collection.services.length, 2);

      expect(collection.services[0].lifetime, ServiceLifetime.singleton);
      expect(collection.services[0].implementationFactory, factory1);

      expect(collection.services[1].lifetime, ServiceLifetime.singleton);
      expect(collection.services[1].implementationFactory, factory2);
    });

    test('when_adding_single_impls_with_base_collection_should_contain_service', () {
      final factory = (_) => Impl1();
      final collection = ServicesCollection();
      collection.base<Base>(
        (base) => base //
            .addSingleton(factory),
      );

      expect(collection.services.length, 1);
      expect(collection.services[0].lifetime, ServiceLifetime.singleton);
      expect(collection.services[0].implementationFactory, factory);
      expect(collection.services[0].serviceType, Base);
    });
  });
}
