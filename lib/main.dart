import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_tutorial/counter_provider.dart';
import 'package:state_managment_tutorial/home_screen.dart';

void main() {
  // 1- Wrap the entire app inside a Provider widget (ChangeNotifierProvider).
  //    This makes CounterProvider available *down the widget tree*.
  //    Any widget can now access the provider via context (Provider.of / Consumer).
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(), // provider is created once at the root
      child: const MyApp(), // MyApp and all children can listen to CounterProvider
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 2- MaterialApp as the root of the app:
    //    defines global theme, routes, and sets HomeScreen as the start point.
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}
