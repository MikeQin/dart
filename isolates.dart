import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

List<Isolate> isolates;

class CustomObject {
  String message;
  SendPort sendPort;

  CustomObject(this.message, this.sendPort);
}

Future<void> start() async {
  isolates = new List();
  ReceivePort receivePort = ReceivePort();

  CustomObject object1 = new CustomObject('1', receivePort.sendPort);
  CustomObject object2 = new CustomObject('2', receivePort.sendPort);
  CustomObject object3 = new CustomObject('3', receivePort.sendPort);

  isolates.add(await Isolate.spawn(runSomething, object1));
  isolates.add(await Isolate.spawn(runSomething, object2));
  isolates.add(await Isolate.spawn(runSomething, object3));

  receivePort.listen((data) {
    print('RECEIVED Data: $data');
  });
}

Future<void> runSomething(CustomObject object) async {
  print('https://swapi.co/api/people/${object.message}');
  var request = await HttpClient()
      .getUrl(Uri.parse('https://swapi.co/api/people/${object.message}'));
  var response = await request.close();

  await for (var contents in response.transform(Utf8Decoder())) {
    object.sendPort.send(contents);
  }
}

void stop() {
  for (Isolate i in isolates) {
    if (i != null) {
      i.kill(priority: Isolate.immediate);
      i = null;
      print('Killed');
    }
  }
}

Future<void> main() async {
  await start();

  print('Press enter to exit');
  await stdin.first;

  stop();
  exit(0);
}
