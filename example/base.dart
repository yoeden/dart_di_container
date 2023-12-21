mixin BaseServiceA {
  void foo();
}

class ServiceB implements BaseServiceA {
  @override
  void foo() {
    print("From service B");
  }
}

class ServiceA implements BaseServiceA {
  @override
  void foo() {
    print("From service A");
  }
}
