import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
  TextEditingController emailcontroller = TextEditingController();

Widget Emailtextfild() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
      child: TextField(
        controller: emailcontroller,
        decoration: InputDecoration(hintText: "Email"),
      ),
    );
  }