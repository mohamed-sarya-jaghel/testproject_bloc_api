part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class AddEvent extends CounterEvent {}

class MinusEvent extends CounterEvent {}
class ResetEvent extends CounterEvent {}