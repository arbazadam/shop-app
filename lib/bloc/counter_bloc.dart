import 'dart:async';

enum Events { increment, decrement, reset }

class CounterBloc {
  int count=0;
  StreamController<int> countController = StreamController.broadcast();
  StreamSink get counterSink => countController.sink;
  Stream get counterStream => countController.stream;

  StreamController<Events> eventController = StreamController();
  StreamSink get eventSink => eventController.sink;
  Stream get eventStream => eventController.stream;

  CounterBloc()
  {
    eventStream.listen((event) {
      if(event==Events.increment)
      {
count++;
counterSink.add(count);
      }
      else if(event==Events.decrement)
      {
count--;
counterSink.add(count);
      }
      else
      {
        count=0;
        counterSink.add(count);
      }
    });
  }
  void dispose()
  {
    countController.close();
    eventController.close();
  }
}
