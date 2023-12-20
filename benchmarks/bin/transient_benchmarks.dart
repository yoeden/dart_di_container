import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:get_it/get_it.dart';
import 'package:injector/injector.dart';
import 'package:ioc_container/ioc_container.dart';
import 'package:kiwi/kiwi.dart';
import 'package:services/services.dart';

var kiwi = KiwiContainer();
late ServiceProvider services;
final getIt = GetIt.instance;
final injector = Injector.appInstance;
late IocContainer iocContainer;

void main(List<String> arguments) {
  //
  kiwi.registerFactory((container) => Impl());

  //
  getIt.registerFactory<Impl>(() => Impl());

  //
  injector.registerDependency(() => Impl());

  //
  final iocBuilder = IocContainerBuilder()..add((_) => Impl());
  iocContainer = iocBuilder.toContainer();

  //
  services = ServicesCollection() //
      .add<Impl>((_) => Impl())
      .build();

  KiwiResolveSingleton().report();
  GetItResolveSingleton().report();
  InjectorResolveSingleton().report();
  IocContainerResolveSingleton().report();
  ServicesResolveSingleton().report();
}

class KiwiResolveSingleton extends BenchmarkBase {
  KiwiResolveSingleton() : super("Kiwi - Resolve Transient");

  // The benchmark code.
  @override
  void run() {
    kiwi.resolve<Impl>();
  }
}

class InjectorResolveSingleton extends BenchmarkBase {
  InjectorResolveSingleton() : super("Injector - Resolve Transient");

  // The benchmark code.
  @override
  void run() {
    injector.get<Impl>();
  }
}

class IocContainerResolveSingleton extends BenchmarkBase {
  IocContainerResolveSingleton() : super("IoC Container - Resolve Transient");

  // The benchmark code.
  @override
  void run() {
    iocContainer.get<Impl>();
  }
}

class GetItResolveSingleton extends BenchmarkBase {
  GetItResolveSingleton() : super("GetIt - Resolve Transient");

  // The benchmark code.
  @override
  void run() {
    getIt.get<Impl>();
  }
}

class ServicesResolveSingleton extends BenchmarkBase {
  ServicesResolveSingleton() : super("Services - Resolve Transient");

  // The benchmark code.
  @override
  void run() {
    services.get(Impl);
  }
}

//

abstract class Base {}

class Impl extends Base {}
