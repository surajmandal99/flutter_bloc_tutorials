import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/counter_bloc/counter_bloc.dart';
import '../../bloc/counter_bloc/counter_event.dart';
import '../../bloc/counter_bloc/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Counter Example'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
                buildWhen: (previous, current) =>
                    previous.counter != current.counter,
                builder: (context, state) {
                  return Center(
                      child: Text(
                    state.counter.toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 60),
                  ));
                }),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementCounter());
                    },
                    child: const Text('Add')),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      //    context.read<CounterBloc>().add( SwitchEvent());
                      context.read<CounterBloc>().add(DecrementCounter());
                    },
                    child: const Text('Removed')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
