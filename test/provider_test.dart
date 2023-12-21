import 'package:di_container/di_container.dart';
import 'package:test/test.dart';

import 'descriptor_test.dart';

void main() {
  group('Service Provider', () {
    //final collection = ServicesCollection();

    setUp(() {
      // Additional setup goes here.
    });

    tearDown(() {
      //
    });

    test('when_requesting_transient_service_should_return_service', () {
      final services = ServicesCollection() //
          .add<Impl1>((_) => Impl1())
          .build();

      final service = services.get(Impl1);

      expect(service.runtimeType, Impl1);
    });

    test('when_requesting_base_transient_service_should_return_service', () {
      final services = ServicesCollection() //
          .base<Base>((base) => base.add((_) => Impl1()))
          .build();

      final service = services.get(Base);

      expect(service.runtimeType, Impl1);
    });

    test('when_requesting_multiple_base_transient_service_should_return_service', () {
      final services = ServicesCollection() //
          .base<Base>(
            (base) => base //
                .add((_) => Impl1())
                .add((_) => Impl2()),
          )
          .build();

      final service = services.getMany(Base);

      expect(service.length, 2);
      expect(service[0].runtimeType, Impl1);
      expect(service[1].runtimeType, Impl2);
    });

    test('when_requesting_transient_service_lifetime_should_be_transient', () {
      final services = ServicesCollection() //
          .add<Impl1>((_) => Impl1())
          .build();

      final service1 = services.get(Impl1);
      final service2 = services.get(Impl1);

      expect(identical(service1, service2), false);
    });

    test('when_requesting_singelton_service_should_return_service', () {
      final services = ServicesCollection() //
          .addSingleton<Impl1>((_) => Impl1())
          .build();

      final service = services.get(Impl1);

      expect(service.runtimeType, Impl1);
    });

    test('when_requesting_base_singleton_service_should_return_service', () {
      final services = ServicesCollection() //
          .base<Base>((base) => base.addSingleton((_) => Impl1()))
          .build();

      final service = services.get(Base);

      expect(service.runtimeType, Impl1);
    });

    test('when_requesting_multiple_base_transient_service_should_return_service', () {
      final services = ServicesCollection() //
          .base<Base>(
            (base) => base //
                .addSingleton((_) => Impl1())
                .addSingleton((_) => Impl2()),
          )
          .build();

      final serviceMany = services.getMany(Base);

      expect(serviceMany.length, 2);
      expect(serviceMany[0].runtimeType, Impl1);
      expect(serviceMany[1].runtimeType, Impl2);
    });

    test('when_requesting_transient_service_lifetime_should_be_singleton', () {
      final services = ServicesCollection() //
          .addSingleton<Impl1>((_) => Impl1())
          .build();

      final service1 = services.get(Impl1);
      final service2 = services.get(Impl1);

      expect(identical(service1, service2), true);
    });

    test('when_requesting_not_existing_service_should_throw', () {
      final services = ServicesCollection().build();

      expect(() => services.get(Impl1), throwsA(isA<Exception>()));
    });

    test('when_requesting_many_not_existing_service_should_throw', () {
      final services = ServicesCollection().build();

      expect(() => services.getMany(Impl1), throwsA(isA<Exception>()));
    });

    test('when_try_requesting_not_existing_service_should_throw', () {
      final services = ServicesCollection().build();

      expect(services.tryGet(Impl1), null);
    });

    test('when_try_requesting_many_not_existing_service_should_throw', () {
      final services = ServicesCollection().build();

      expect(services.tryGetMany(Impl1), null);
    });

    test('when_try_requesting_multiple_registered_types_should_return_newest', () {
      final services = ServicesCollection() //
          .base<Base>(
            (base) => base //
                .add((services) => Impl1())
                .addSingleton((services) => Impl2()),
          )
          .build();

      final service = services.getOf<Base>();

      expect(service.runtimeType, Impl2);
    });
  });
}
