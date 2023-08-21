import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/Api1/getUsersApi.dart';
import '../data/Model1/User_model.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoBloc() : super(InfoInitial()) {
    on<GetuserData>(_getUserList);
    on<PostuserData>(_postUserList);
  }

  FutureOr<void> _getUserList(
      GetuserData event, Emitter<InfoState> emit) async {
    emit(LoadingState());
    try {
      List<User> user = await ApiProvider().getUsers();
      emit(SussesdataState(user));
    } catch (error) {
      emit(ErrorState(message: "Something Went Error,Please Try Again later"));
    }
  }

  FutureOr<void> _postUserList(
      PostuserData event, Emitter<InfoState> emit) async {
    emit(LoadingState());
    try {
      bool iscreated = await ApiProvider().postUser(
        name: event.name,
        gender: event.gender,
        email: event.email,
      );
      if (iscreated) {
        emit(SusessCreatedState());
      } else {
        emit(
            ErrorState(message: "Something Went Error,Please Try Again later"));
      }
    } catch (error) {
      emit(ErrorState(message: "Something Went Error,Please Try Again later"));
    }
  }
}
