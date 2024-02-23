import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorials/bloc/counter_bloc/bloc/todo/bloc/todo_bloc_bloc.dart';
import 'package:flutter_bloc_tutorials/bloc/favourite/bloc/favourite_bloc.dart';
import 'package:flutter_bloc_tutorials/bloc/image_picker/bloc/image_picker_bloc.dart';
import 'package:flutter_bloc_tutorials/bloc/switch_bloc/bloc/switch_bloc.dart';
import 'package:flutter_bloc_tutorials/utils/image_picker_utils.dart';
import 'package:flutter_bloc_tutorials/view/image_picker/image_picker_screen.dart';
import 'bloc/counter_bloc/bloc/counter_bloc.dart';
import 'bloc/favourite/bloc/favourite_event.dart';
import 'repository/favourite_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(create: (_) => ToDoBloc()),
          BlocProvider(
              create: (_) => FavouriteBloc(FavouriteRepository())
                ..add(FetchFavouriteList())),
          BlocProvider(create: (_) => SwitchBloc()),
          BlocProvider(
            create: (_) => ImagePickerBloc(
              ImagePickerUtils(),
            ),
          )
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Favourite App',
          home: ImagePickerScreen(),
        ));
  }
}
