class Animal {}
class Cat extends Animal {}
class Bird extends Animal {}

class NewAnimal<T extends Animal> {
  String toString() => "创建一个新的小动物: 'Foo<$T>'";
}

main() {
  var cat = NewAnimal<Cat>();
  var bird = NewAnimal<Bird>();
  // 不传泛型默认为Animal
  var animal = NewAnimal();
  print(cat);
  print(bird);
  print(animal);

  List<NewAnimal> animals = List<NewAnimal>();
  animals.add(cat);
  animals.add(bird);
  animals.add(animal);
}