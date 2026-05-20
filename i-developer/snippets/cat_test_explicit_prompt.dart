void main() {
  group('Animal', () {
    test(
      '''
      GIVEN my animal is a cat
      WHEN it speaks
      THEN it should meow
      ''',
      () {
        final cat = Cat();
        final output = cat.speak();
        expect(output, equals('meow'));
      },
    );
  });
}
