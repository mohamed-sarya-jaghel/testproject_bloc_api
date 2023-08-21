// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'info_bloc.dart';

@immutable
sealed class InfoEvent {}

class GetuserData extends InfoEvent {}

class PostuserData extends InfoEvent {
  String email;
  String gender;
  String name;
  PostuserData({
    required this.email,
    required this.gender,
    required this.name,
  });
}
