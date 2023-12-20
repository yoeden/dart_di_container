import 'package:di_container/services.dart';

class ServiceProviderImpl extends ServiceProvider {
  final Map<Type, Object> _singletonInstances = {};
  final Map<Type, List<ServiceDescriptor>> descriptors;

  ServiceProviderImpl({
    required this.descriptors,
  });

  @override
  Object get(Type t) {
    if (!descriptors.containsKey(t)) throw Exception("Service not found");

    var descriptor = descriptors[t]!.last;
    return _resolve(descriptor);
  }

  @override
  List<Object> getMany(Type t) {
    if (!descriptors.containsKey(t)) throw Exception("Service not found");

    var local = descriptors[t]!;
    return local.map((e) => _resolve(e)).toList();
  }

  Object _resolve(ServiceDescriptor descriptor) {
    switch (descriptor.lifetime) {
      case ServiceLifetime.singleton:
        return _resolveSingleton(descriptor);
      case ServiceLifetime.transient:
        return descriptor.implementationFactory(this);
    }
  }

  /// Resolves a singleton instance for the given [descriptor].
  /// If the instance is already cached, returns the cached instance.
  /// If the [implementationType] is provided in the [descriptor], it is used as the key for caching the instance.
  /// Otherwise, the [serviceType] is used as the key.
  /// If the instance is not cached, it is created using the [implementationFactory] function and cached for future use.
  dynamic _resolveSingleton(ServiceDescriptor descriptor) {
    // Check if the instance is already cached using the implementationType as the key
    if (_singletonInstances.containsKey(descriptor.implementationType)) {
      return _singletonInstances[descriptor.implementationType]!;
    }

    // If implementationType is not provided, check if the instance is cached using the serviceType as the key
    if (descriptor.implementationType == null && _singletonInstances.containsKey(descriptor.serviceType)) {
      return _singletonInstances[descriptor.serviceType]!;
    }

    // Create a new singleton instance using the implementationFactory function
    final singleton = descriptor.implementationFactory(this);

    // Cache the singleton instance using the implementationType or serviceType as the key
    _singletonInstances[descriptor.implementationType ?? descriptor.serviceType] = singleton;

    // Return the singleton instance
    return singleton;
  }
}
