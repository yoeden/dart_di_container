import 'package:di_container/di_container.dart';

// Private variable to hold the service provider instance.
ServiceProvider? _gServices;

// Getter to access the global service provider.
ServiceProvider get gServices {
  // Throws an exception if the global service provider is not set.
  if (_gServices == null) throw Exception("Use `[ServiceProvider].setGlobal()` to set services.");

  return _gServices!;
}

// Extension method to set the global service provider.
extension SetGlobalServicesCollectionExt on ServiceProvider {
  // Sets the global service provider and returns it.
  ServiceProvider setGlobal() {
    _gServices = this;
    return this;
  }
}
