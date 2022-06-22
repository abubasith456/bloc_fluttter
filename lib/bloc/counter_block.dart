import 'dart:async';

enum CounterAction {
  increment,
  decrememt,
  reset,
}

class CounterBlock {
  late int counter;

//Pip
  final _stateStreamController = StreamController<int>(); //Its a pip do

  StreamSink<int> get counterSink =>
      _stateStreamController.sink; //Input stream sink

  Stream<int> get counterStream =>
      _stateStreamController.stream; //Output stream

//Event
  final _eventStreamController =
      StreamController<CounterAction>(); // Event controller
  StreamSink<CounterAction> get eventSink =>
      _eventStreamController.sink; //Event Input stream sink

  Stream<CounterAction> get eventStream =>
      _eventStreamController.stream; //Event Output stream

  CounterBlock() {
    counter = 0;
    eventStream.listen((event) {
      if (event == CounterAction.increment) {
        counter++;
      } else if (event == CounterAction.decrememt) {
        if (counter > 0) {
          counter--;
          print("counter > 0 Called");
        } else if (counter < 0) {
          print("counter < 0 Called");
          counter = 0;
        }
      } else if (event == CounterAction.reset) {
        counter = 0;
      }

      counterSink.add(counter);
    });
  }
}
