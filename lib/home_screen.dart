import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_tutorial/counter_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 3- Access the provider instance.
    //    This pulls the current CounterProvider from the widget tree.
    //    Because we're using `Provider.of`, this widget will rebuild
    //    whenever notifyListeners() is called in CounterProvider.
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            // 4- UI reads the provider state (counter).
            //    Whenever counter changes and notifyListeners() is called,
            //    this Text widget rebuilds with the new value.
            Text(
              counterProvider.counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

      // 5- Multiple actions: increment, decrement, reset.
      //    Only ONE floatingActionButton is allowed,
      //    so we wrap them inside a Row for multiple buttons.
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: counterProvider.increment,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: counterProvider.decrement,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: counterProvider.reset,
            tooltip: 'Reset',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
/*
---------------------- BuildContext usage ----------------------

In Flutter, many core features rely on `BuildContext`.
Think of context as a "handle" to the position of a widget in the widget tree.
It gives us access to:

1) Provider.of<T>(context)
   - Used to *read* state or controllers injected higher in the tree.
   - Example: final counter = Provider.of<CounterProvider>(context);
   - Rebuilds this widget whenever notifyListeners() is called.

2) ScaffoldMessenger.of(context).showSnackBar(...)
   - Used to show a SnackBar from anywhere in the tree
     (as long as there’s a Scaffold ancestor).
   - Example: ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Hello"))
              );

3) Navigator.of(context).push(...) / pop(...)
   - Used to navigate between screens.
   - Navigator looks up the widget tree to find the nearest Navigator.
   - Example: Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => NextScreen())
              );

⚡ In short:
- Provider uses context to find and listen to state objects.
- SnackBar uses context to locate the nearest ScaffoldMessenger.
- Navigator uses context to locate the nearest Navigator in the tree.

So `context` isn’t just a parameter —
it’s the gateway to everything tied to your widget’s place in the tree.
---------------------------------------------------------------
*/
