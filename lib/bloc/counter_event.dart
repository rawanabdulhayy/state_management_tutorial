abstract class CounterEvent {
  //every event should extend this base class of all events
}
class IncrementCounter extends CounterEvent{}
//1- we have our event defined and extending our base events class
class DecrementCounter extends CounterEvent{}
class ResetCounter extends CounterEvent{}