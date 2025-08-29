// event (IncrementCounter) >> bloc (logic handler) >> state (reflected back to UI)

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment_tutorial/bloc/counter_event.dart';
import 'package:state_managment_tutorial/bloc/counter_state.dart';

// A Bloc always works with 2 types:
//   1) Event type  → tells the bloc *what happened* (user interaction, system trigger, etc.)
//   2) State type  → tells the UI *what the app should look like* after logic is applied.
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // super() sets the **initial state** of the bloc.
  // Here, our counter starts at 0 before any events are dispatched.
  CounterBloc() : super(CounterState(counter: 0)) {
    // -------------------------------------------------------------------
    // on<EventType>((event, emit) { ... })
    //
    // Registers a handler for a specific event.
    // - `event` → the incoming action (e.g., IncrementCounter).
    // - `emit`  → function used to output a *new* immutable state
    //             (which triggers UI rebuild in BlocBuilder).
    //
    // -------------------------------------------------------------------
    //
    // When IncrementCounter event is dispatched:
    //    - Read the current state (state.counter).
    //    - Create and emit a new CounterState with counter + 1.
    on<IncrementCounter>((event, emit) {
      emit(CounterState(counter: state.counter + 1));
    });
    on<DecrementCounter>((event, emit) {
      emit(CounterState(counter: state.counter - 1));
    });
    on<ResetCounter>((event, emit) {
      emit(CounterState(counter: 0));
    });
  }
}
