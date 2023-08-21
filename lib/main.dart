// ignore_for_file: prefer_const_constructors

import 'package:api_bloc_2023_3/bloc/counter_bloc.dart';
import 'package:api_bloc_2023_3/bloc/info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // routes: {
        //   'addtodopage': (context) => const AddtodoPage(),
        // },X
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => InfoBloc(),
            ),
            BlocProvider(
              create: (context) => CounterBloc(),
            )
          ],
          child: Homepage(),
        ));
  }
}
