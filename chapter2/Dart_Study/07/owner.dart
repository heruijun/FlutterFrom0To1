class Cat {
  void show() {
    print("小猫");
  }
}

class Bird {
  void show() {
    print("小鸟");
  }
}

class Owner {
  void show() {
    print("主人");
  }
}

class Person1 extends Owner with Cat, Bird {
  // void show() {
  //   print("主人养了猫和小鸟");
  // }
}

class Person2 extends Owner with Cat implements Bird {
  // void show() {
  //   print("主人养了猫和小鸟");
  // }
}

main() {
  Person1()..show();
  Person2()..show();
}