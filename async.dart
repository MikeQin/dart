import 'dart:async';

Future<void> createOrderMessage() async {
  print('Awaiting user order...');
  String order = await getUserOrder();
  print('Your order is: $order');
}

Future<String> getUserOrder() {
  // Imagine that this function is more complex and slow.
  return Future.delayed(Duration(seconds: 4), () => 'Large Latte');
}

Future<void> main() async {
  //countSeconds(5);
  await createOrderMessage();
}

// You can ignore this function - it's here to visualize delay time in this example.
void countSeconds(s) {
  for (var i = 1; i <= s; i++) {
    Future.delayed(Duration(seconds: i), () => print(i));
  }
}
