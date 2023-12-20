/// Abstract class representing a service provider.
abstract class ServiceProvider {
  /// Retrieves multiple services of the specified type [t].
  List<Object> getMany(Type t);

  /// Tries to retrieve all services of the specified type [t].
  /// Returns null if an exception occurs.
  List<Object>? tryGetMany(Type t) {
    try {
      return getMany(t);
    } catch (e) {
      return null;
    }
  }

  /// Retrieves a service of the specified type [t].
  Object get(Type t);

  /// Tries to retrieve a service of the specified type [t].
  /// Returns null if an exception occurs.
  Object? tryGet(Type t) {
    try {
      return get(t);
    } catch (e) {
      return null;
    }
  }
}
