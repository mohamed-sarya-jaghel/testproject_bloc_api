import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
  TextEditingController gendercontroller = TextEditingController();

  Widget Gengertextfild() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
      child: TextField(
        controller: gendercontroller,
        decoration: InputDecoration(hintText: "Gender "),
      ),
    );
  }
