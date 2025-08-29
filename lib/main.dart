import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_tutorial/bloc/counter_bloc.dart';
import 'package:state_managment_tutorial/bloc/home_screen_2.dart';
import 'package:state_managment_tutorial/provider/counter_provider.dart';
import 'package:state_managment_tutorial/provider/home_screen.dart';

void main() {
  // // 1- Wrap the entire app inside a Provider widget (ChangeNotifierProvider).
  // //    This makes CounterProvider available *down the widget tree*.
  // //    Any widget can now access the provider via context (Provider.of / Consumer).
  // runApp(
  //   ChangeNotifierProvider(
  //     create: (context) => CounterProvider(), // provider is created once at the root
  //     child: const MyApp(), // MyApp and all children can listen to CounterProvider
  //   ),
  // );

  runApp(
    BlocProvider(
      create: (context) => CounterBloc(),
      // 1- Bloc instance is created once here at the root of the widget tree.
      //    This ensures the same CounterBloc is accessible throughout the app lifecycle.
      //    Any widget lower in the tree can read this bloc using context.read or context.watch.
      child: const MyApp(),
      // 2- MyApp and all its descendant widgets can now access CounterBloc.
      //    No need for manual passing of objects through constructors.
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
      home: HomeScreen2(),
    );
  }
}
