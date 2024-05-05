import 'package:counter_with_cubit/cubit/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitial());

  int counter = 0;
  add() {
    emit(CounterLoading());
    Future.delayed(const Duration(seconds: 2)).then((value) {
      counter++;
      emit(CounterUpdated());
    });
  }

  remove() {
    counter--;
    emit(CounterUpdated());
  }

  login() {
    // emit loading state
    // try login
    // if success emit success state
    // else emit error state
  }
}
