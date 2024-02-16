import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorials/bloc/counter_bloc/bloc/todo/bloc/todo_bloc_bloc.dart';
import 'package:flutter_bloc_tutorials/bloc/favourite/bloc/favourite_bloc.dart';
import 'package:flutter_bloc_tutorials/view/favourite/favourite_screen.dart';
// import 'package:flutter_bloc_tutorials/view/counter/counter_screen.dart';
// import 'package:flutter_bloc_tutorials/view/todo/todo_screen.dart';

import 'bloc/counter_bloc/bloc/counter_bloc.dart';
import 'bloc/favourite/bloc/favourite_event.dart';
import 'repository/favourite_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(create: (_) => ToDoBloc()),
          BlocProvider(
              create: (_) => FavouriteBloc(FavouriteRepository())
                ..add(FetchFavouriteList())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const FavouriteScreen(),
        ));
  }
}
