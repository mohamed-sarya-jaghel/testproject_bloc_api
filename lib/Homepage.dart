// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:api_bloc_2023_3/bloc/counter_bloc.dart';
import 'package:api_bloc_2023_3/bloc/info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Widgets1/Builduserlist.dart';
import 'Widgets1/Emailtextfild.dart';
import 'Widgets1/Gendertextfild.dart';
import 'Widgets1/Nametextfild.dart';

// ignore: must_be_immutable
class Homepage extends StatelessWidget {
  const Homepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildbloc());
  }

  Widget buildbloc() {
    return BlocBuilder<InfoBloc, InfoState>(builder: (context, state) {
      if (state is SusessCreatedState) {
        return Center(
          child: Container(
            width: 400,
            height: 100,
            decoration: BoxDecoration(color: Colors.pink),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Name is ${namecontroller.text}',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  'your Email is ${emailcontroller.text}',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  'your Gender is ${gendercontroller.text}',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ),
          ),
        );
      }
      if (state is LoadingState) {
        return Center(child: CircularProgressIndicator());
      } else if (state is SussesdataState) {
        return buildUserList(state.userlist);
      } else if (state is ErrorState) {
        return Center(
            child: Text(
          state.message,
          style: TextStyle(color: Colors.red, fontSize: 25),
        ));
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Nametextfild(),
            Emailtextfild(),
            Gengertextfild(),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<InfoBloc>().add(GetuserData());
                },
                child: const Text("Get  data")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<InfoBloc>().add(PostuserData(
                      email: emailcontroller.text,
                      gender: gendercontroller.text,
                      name: namecontroller.text));
                },
                child: const Text("Post  data")),
            SizedBox(
              height: 20,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(MinusEvent());
                  },
                  child: Text(
                    "Minus",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    if (state is CounterValueState) {
                      return CircleAvatar(
                        backgroundColor: Colors.pink,
                        radius: 25,
                        child: Text(
                          state.counter.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(AddEvent());
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                )
              ],
            ),
            BlocListener<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state is CounterValueState) {
                  Scaffold.of(context).showBottomSheet((context) => Container(
                        width: double.infinity,
                        height: 60,
                        color: Colors.blue,
                        child: Center(
                            child: Text(
                          'the value is ${state.counter.toString()}',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )),
                      ));
                }
              },
              child: Container(),
            )
          ],
        );
      }
    });
  }
}
