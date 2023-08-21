import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
  TextEditingController namecontroller = TextEditingController();

Widget Nametextfild() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
      child: TextField(
        controller: namecontroller,
        decoration: InputDecoration(hintText: "Name"),
      ),
    );
  }