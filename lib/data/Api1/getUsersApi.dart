import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../Model1/User_model.dart';

class ApiProvider {
  Future<List<User>> getUsers() async {
    print("getting User List.....");
    List<User> usersList = [];
    print("connect to internet");
    Response response =
        await http.get(Uri.parse('https://gorest.co.in/public/v2/users'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      body.forEach((json) {
        print(json);
        usersList.add(User.fromJson(json));
      });
      return usersList;
    }
    return [];
  }

  Future<bool> postUser(
      {required String name,
      required String gender,
      required String email}) async {
    print("Creating User .....");
    var response = await http.post(
        Uri.parse(
          "https://gorest.co.in/public/v2/users",
        ),
        headers: {
          "Authorization":
              "Bearer ed0645c09baf75ccb7b21afc0af41ab01f0770fd90e831d5295fab6c77d96965",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "name": "$name",
          "gender": "$gender",
          "email": "$email",
          "status": "active",
        }));

    print(response.body);
    if (response.statusCode == 201) {
      return true;
    } else
      return false;
  }
}
