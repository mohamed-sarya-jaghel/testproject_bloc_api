// ignore: duplicate_ignore
// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'info_bloc.dart';

@immutable
sealed class InfoState {}

final class InfoInitial extends InfoState {}

class LoadingState extends InfoState {}

class SussesdataState extends InfoState {
  List<User> userlist;
  SussesdataState(
    this.userlist,
  );
}

class ErrorState extends InfoState {
  String message;
  ErrorState({
    required this.message,
  });
}
class SusessCreatedState extends InfoState {}
