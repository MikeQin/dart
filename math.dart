import 'dart:math';

void main() {
  var a = List<int>.generate(30, (int index) => index);
  var input = [];
  var output = [];
  for (int i = 1; i < a.length; i++) {
    input.add(a[i] * a[i] + a[i] * a[i]);
  }
  print("input: $input");
  for (int i in input) {
    output.add(pow(i, 3) - 33);
  }
  print("output: $output");
}
