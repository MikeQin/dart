void main() {
  // final str = <String>['One', 'Two', 'Three'];
  // for (final s in str) {
  //   print(s);
  // }

  // final lengths = str.map((s) => s.length);

  // for (final length in lengths) {
  //   print(length);
  // }

  //final numbers = getRange(1, 10).where((num) => num % 2 == 0);

  // loop 1: for-in
  // for (int val in numbers) {
  //   print(val);
  // }

  // loop 2: for each
  //numbers.forEach(print);

  fetchDoubles(1, 10).listen(print);
}

// Generator
Iterable<int> getRange(int start, int finish) sync* {
  // for (int i = start; i <= finish; i++) {
  //   yield i;
  // }

// Recursive style
  if (start <= finish) {
    yield start;
    // for (final val in getRange(start + 1, finish)) {
    //   yield val;
    // }
    yield* getRange(start + 1, finish);
  }
}

Future<int> fetchDouble(int val) async {
  // Fetch val * 2 from the server
  return await val * 2;
}

// Async Generator
Stream<int> fetchDoubles(int start, int finish) async* {
  // for (int i = start; i <= finish; i++) {
  //   yield await fetchDouble(i);
  // }

  // Recursive version
  if (start <= finish) {
    yield await fetchDouble(start);
    yield* fetchDoubles(start + 1, finish);
  }
}
