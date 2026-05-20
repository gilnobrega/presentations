abstract class Animal {
  String speak();
}

class Dog extends Animal {
  String speak() => 'bark';
}

class Cat extends Animal {
  String speak() => 'meow';
}
