void main() {
  group('Cat', () {
    test('speak should return meow', () {
      // Arrange
      final cat = Cat();

      // Act
      final result = cat.speak();

      // Assert
      expect(result, equals('meow'));
    });
  });
}
