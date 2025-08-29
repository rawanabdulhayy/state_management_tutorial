import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_tutorial/bloc/counter_event.dart';
import 'package:state_managment_tutorial/bloc/counter_state.dart';

import 'counter_bloc.dart';

//builder bt3mel widgets rebuild, listener btshuf lby7sl bas, consumer does both.
class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});
  //we don't have to instantiate anything here before usage unlike provider.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //a3mly wrap in a builder 3adeya then change it, also BlocBuilder btakhud BLOC w STATE WHILE builder takes CONTEXT and STATE.
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times:'),
                Text(
                  state.counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed:
                () => context.read<CounterBloc>().add(IncrementCounter()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            // When the user taps the button, this *event* gets fired.
            // In Bloc, the UI never changes the state directly (no counter++).
            // Instead, the UI sends a signal → "Hey Bloc, this just happened!"
            //
            // That signal is an Event (like IncrementCounter).
            // The Bloc listens for events, runs the business logic, and emits a new State.
            // Once a new State is emitted, any widget (UI) that is *watching* the Bloc’s state
            // will rebuild and show the updated value (e.g. the counter text above).
            //
            // UI (Button Press)
            //    >> Event (IncrementCounter)
            //       >> Bloc (handles logic & updates state)
            //          >> New State (CounterState with updated counter)
            //             >> UI (BlocBuilder rebuilds & shows new value)
            //
            // 🔹 Why context.read?
            // - `context.read<CounterBloc>()` looks up the CounterBloc from the widget tree
            //   without subscribing to updates (it won’t rebuild).
            // - Then we call `.add(IncrementCounter())` to dispatch the event.
            //   Think of `.add()` like dropping a "task" into the Bloc’s inbox.
            //   The Bloc processes it, changes the state, and notifies listeners.
            //
            // If we used `context.watch<CounterBloc>()` here, the button itself would rebuild
            // every time the state changes, which is unnecessary. So read is correct.
            onPressed:
                () => context.read<CounterBloc>().add(DecrementCounter()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(ResetCounter()),
            tooltip: 'Reset',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
