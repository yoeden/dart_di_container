import 'package:di_container/di_container.dart';
import 'package:di_container/src/provider/impl.dart';

class ServiceImplements<TService> {
  final ServicesCollection _collection;

  ServiceImplements(this._collection);

  /// Adds a service implementation with the provided [factory] function.
  /// The service is registered with transient lifetime.
  ServiceImplements<TService> add<TImpl extends TService>(ServiceFactory<TImpl> factory) {
    _collection.services.add(ServiceDescriptor.factoryWithBase<TService, TImpl>(factory, ServiceLifetime.transient));
    return this;
  }

  /// Adds a singleton service implementation with the provided [factory] function.
  ServiceImplements<TService> addSingleton<TImpl extends TService>(ServiceFactory<TImpl> factory) {
    _collection.services.add(ServiceDescriptor.factoryWithBase<TService, TImpl>(factory, ServiceLifetime.singleton));
    return this;
  }
}

extension ServicesCollectionExt on ServicesCollection {
  /// Extension method to perform operations on the base [ServicesCollection].
  ServicesCollection base<TService>(ServiceImplements<TService> Function(ServiceImplements<TService> base) func) {
    func(ServiceImplements<TService>(this));
    return this;
  }

  /// Adds a service to the collection with the provided [factory] function.
  /// The service is registered with transient lifetime.
  ServicesCollection add<TService>(ServiceFactory<TService> factory) {
    services.add(ServiceDescriptor.factory<TService>(factory, ServiceLifetime.transient));
    return this;
  }

  /// Adds a singleton service to the collection with the provided [factory] function.
  ServicesCollection addSingleton<TService>(ServiceFactory<TService> factory) {
    services.add(ServiceDescriptor.factory<TService>(factory, ServiceLifetime.singleton));
    return this;
  }
}

extension BuildServicesCollectionExt on ServicesCollection {
  /// Builds a [ServiceProvider] from the services in the collection.
  ServiceProvider build() {
    final map = <Type, List<ServiceDescriptor>>{};
    for (var service in services) {
      if (!map.containsKey(service.serviceType)) map[service.serviceType] = [];

      map[service.serviceType]!.add(service);
    }

    return ServiceProviderImpl(descriptors: Map.unmodifiable(map));
  }
}
