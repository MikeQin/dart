import 'dart:math';

void main() {
  var a = List<double>.generate(16, (int index) => index * 1.0);
  var input = <double>[];
  var output = <double>[];
  for (int i = 9; i < a.length; i++) {
    input.add(a[i] * 2 - 1);
  }
  print("input: ${input[input.length - 1]}");
  print(input);
  for (double i in input) {
    output.add(i * 3 - 3);
  }
  print("output: ${output[output.length - 1]}");
  print(output);
}
