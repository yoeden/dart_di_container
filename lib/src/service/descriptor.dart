import 'package:di_container/services.dart';

class ServiceDescriptor {
  /// Gets the Type of the service.
  final Type serviceType;

  /// Gets the ServiceLifetime of the service.
  final ServiceLifetime lifetime;

  /// Gets the Type that implements the service.
  final Type? implementationType;

  /// Gets the factory used for creating service instances.
  final ServiceFactory implementationFactory;

  const ServiceDescriptor._({
    required this.serviceType,
    required this.lifetime,
    required this.implementationFactory,
    this.implementationType,
  });

  static ServiceDescriptor factory<T>(ServiceFactory<T> implementationFactory, ServiceLifetime lifetime) => ServiceDescriptor._(
        serviceType: T,
        lifetime: lifetime,
        implementationFactory: implementationFactory,
      );

  static ServiceDescriptor factoryWithBase<TService, TImplementation extends TService>(
          ServiceFactory<TImplementation> implementationFactory, ServiceLifetime lifetime) =>
      ServiceDescriptor._(
        serviceType: TService,
        implementationType: TImplementation,
        lifetime: lifetime,
        implementationFactory: implementationFactory,
      );
}
