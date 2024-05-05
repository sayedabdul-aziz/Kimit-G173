import 'package:counter_with_cubit/cubit/counter_cubit.dart';
import 'package:counter_with_cubit/cubit/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  // rebuild (هغير فمحتوي الشاشه  ابدل عنصر بعنصر او اغير قيمة موجود)و
  // listen (بتظهر علي الشاشه snackbar , dialog و navigation)

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterStates>(
      listener: (context, state) {
        // if (state is CounterUpdated) {
        //   Navigator.pop(context);
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(
        //       content: Text('Counter Updated'),
        //     ),
        //   );
        // } else {
        //   showDialog(
        //       barrierColor: Colors.black.withOpacity(.2),
        //       context: context,
        //       builder: (context) {
        //         return const SimpleDialog(
        //           backgroundColor: Colors.transparent,
        //           shadowColor: Colors.transparent,
        //           children: [Center(child: CircularProgressIndicator())],
        //         );
        //       });
        // }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Counter'),
          ),
          body: state is CounterLoading
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.read<CounterCubit>().counter.toString(),
                        style: const TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton.filled(
                              onPressed: () {
                                context.read<CounterCubit>().remove();
                              },
                              icon: const Icon(Icons.remove),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            IconButton.filled(
                              onPressed: () {
                                context.read<CounterCubit>().add();
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ])
                    ],
                  ),
                ),
        );
      },
    );
  }
}
