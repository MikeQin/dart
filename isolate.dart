import 'dart:io';
import 'dart:async';
import 'dart:isolate';

Isolate isolate;

Future<void> start() async {
  ReceivePort receivePort =
      ReceivePort(); //port for this main isolate to receive messages.
  isolate = await Isolate.spawn(runTimer, receivePort.sendPort);
  receivePort.listen((data) {
    stdout.writeln('RECEIVE: ' + data + ', ');
  });
}

void runTimer(SendPort sendPort) {
  int counter = 0;
  Timer.periodic(new Duration(seconds: 2), (Timer t) {
    counter++;
    String msg = 'notification ' + counter.toString();
    stdout.write('SEND: ' + msg + ' - ');
    sendPort.send(msg);
  });
}

Future<void> stop() async {
  if (isolate != null) {
    stdout.writeln('killing isolate');
    await isolate.kill(priority: Isolate.immediate);
    isolate = null;
  }
}

Future<void> main() async {
  stdout.writeln('spawning isolate...');
  await start();
  stdout.writeln('press enter key to quit...');
  await stdin.first;
  await stop();
  stdout.writeln('goodbye!');
  exit(0);
}
