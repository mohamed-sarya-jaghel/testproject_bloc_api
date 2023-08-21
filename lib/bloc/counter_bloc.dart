import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    int counter = 0;

    on<CounterEvent>((event, emit) {
      if (event is AddEvent) {
        counter++;
        emit(CounterValueState(counter: counter));
      } else if (event is MinusEvent) {
        counter--;
        emit(CounterValueState(counter: counter));
      } 
    });
  }
}
