import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_tutorial/counter_provider.dart';
import 'package:state_managment_tutorial/home_screen.dart';

void main() {
  //3- wrapping the whole application to listen to any notifications sent through this very provider.
  runApp(
    ChangeNotifierProvider(
      child: const MyApp(),
      create: (context) => CounterProvider(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}
