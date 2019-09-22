main() {
  var arr = [1, 2, 3, 4];
  int sum = 0;
  arr.forEach((e) => sum += e);
  print("sum from forEach:  $sum");

  print('-- forEach --');
  arr.forEach(print);
  print('-- map --');
  var list = arr.map((e) => e * 2).toList();
  print(list);

  print('-- fold --');
  print("sum: ${arr.fold(0, (t, e) => (t + e))}");

  print('-- reduce --');
  int total = arr.reduce((t, e) => (t + e));
  print("total: ${total}");
}
