// import 'package:benchmark_harness/benchmark_harness.dart';
// import 'package:di_container/services.dart';
// import 'package:get_it/get_it.dart';
// import 'package:injector/injector.dart';
// import 'package:ioc_container/ioc_container.dart';
// import 'package:kiwi/kiwi.dart';

// var kiwi = KiwiContainer();
// late ServiceProvider services;
// final getIt = GetIt.instance;
// final injector = Injector.appInstance;
// late IocContainer iocContainer;

// void main(List<String> arguments) {
//   //
//   kiwi.registerSingleton((container) => Impl());

//   //
//   getIt.registerSingleton<Impl>(Impl());

//   //
//   injector.registerSingleton<Impl>(() => Impl());

//   //
//   final iocBuilder = IocContainerBuilder()..addSingletonService(Impl());
//   iocContainer = iocBuilder.toContainer();

//   //
//   services = ServicesCollection() //
//       .addSingleton<Impl>((_) => Impl())
//       .build();

//   KiwiResolveSingleton().report();
//   GetItResolveSingleton().report();
//   InjectorResolveSingleton().report();
//   IocContainerResolveSingleton().report();
//   ServicesResolveSingleton().report();
// }

// class KiwiResolveSingleton extends BenchmarkBase {
//   KiwiResolveSingleton() : super("Kiwi - Resolve Singleton");

//   // The benchmark code.
//   @override
//   void run() {
//     kiwi.resolve<Impl>();
//   }
// }

// class InjectorResolveSingleton extends BenchmarkBase {
//   InjectorResolveSingleton() : super("Injector - Resolve Singleton");

//   // The benchmark code.
//   @override
//   void run() {
//     injector.get<Impl>();
//   }
// }

// class IocContainerResolveSingleton extends BenchmarkBase {
//   IocContainerResolveSingleton() : super("IoC Container - Resolve Singleton");

//   // The benchmark code.
//   @override
//   void run() {
//     iocContainer.get<Impl>();
//   }
// }

// class GetItResolveSingleton extends BenchmarkBase {
//   GetItResolveSingleton() : super("GetIt - Resolve Singleton");

//   // The benchmark code.
//   @override
//   void run() {
//     getIt.get<Impl>();
//   }
// }

// class ServicesResolveSingleton extends BenchmarkBase {
//   ServicesResolveSingleton() : super("Services - Resolve Singleton");

//   // The benchmark code.
//   @override
//   void run() {
//     services.get(Impl);
//   }
// }

// //

// abstract class Base {}

// class Impl extends Base {}
