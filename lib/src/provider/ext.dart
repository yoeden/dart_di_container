import 'package:di_container/services.dart';

/// Extension methods for the [ServiceProvider] class.
extension ServiceProviderExt on ServiceProvider {
  /// Returns a list of objects of type [T].
  ///
  /// Example usage: `serviceProvider.getManyOf<MyService>()`.
  List<T> getManyOf<T>() {
    return getMany(T).cast<T>();
  }

  /// Returns an object of type [T].
  ///
  /// Example usage: `serviceProvider.getOf<MyService>()`.
  T getOf<T>() {
    return get(T) as T;
  }
}
