Future<int> getTotal(Stream<int> numbers) async {
  int total = 0;

  await for (final value in numbers) {
    total += value;
  }

  return total;
}
