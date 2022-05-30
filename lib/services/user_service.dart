//@dart=2.9

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oudarticle/models/user_model.dart';
import 'package:oudarticle/shared/theme.dart';

class UserService {
  
  Future<UserModel> register({
    String name,
    String email,
    String phone_number
  }) async {
    var url = "$baseUrl/users";
    var headers = {
      "Content-Type" : "application/json"
    };

    var body = jsonEncode({
      "name" : name,
      "email" : email,
      "phone_number" : phone_number
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body
    );

    var data = jsonDecode(response.body)['data'];
    UserModel user = UserModel.fromJson(data);

    return user;
  }
}