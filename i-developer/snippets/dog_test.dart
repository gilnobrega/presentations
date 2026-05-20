void main() {
  group('Animal', () {
    test(
      '''
      GIVEN my animal is a dog
      WHEN it speaks
      THEN it should bark
      ''',
      () {
        final dog = Dog();
        final output = dog.speak();
        expect(output, equals('bark'));
      },
    );
  });
}
