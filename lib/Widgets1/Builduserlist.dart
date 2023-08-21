import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/Model1/User_model.dart';

Widget buildUserList(List<User> user) {
  return ListView.builder(
      itemCount: user.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(user[index].name),
              subtitle: Text(user[index].gender),
            ),
          ],
        );
      });
}
