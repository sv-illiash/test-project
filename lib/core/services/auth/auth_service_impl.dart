import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'auth_service.dart';

@LazySingleton(as: AuthService)
class AuthServiceImpl extends AuthService {
  final baseUrl = 'http://backoffice.mybookhabit.io/api';

  @override
  Future login(String email, String password) async {
    var res = await http.post(
      '$baseUrl/login',
      body: jsonEncode({
        'email': email,
        'password': password,
        "password_confirmation": password,
      }),
      headers: {"Content-Type": "application/json"},
    );
    print(res?.body);

    if (res.statusCode == 200) {
      return res?.body;
    } else {
      print(res.statusCode);
    }
  }

  @override
  Future registration(String email, String password) async {
    try {
      var res = await http.post('$baseUrl/register', body: {
        'email': email,
        'password': password,
        "password_confirmation": password,
      }, headers: {
        "Accept": "application/json"
      });
      if (res.statusCode == 200) {
        print(res?.body);
        return res?.body;
      } else {
        print(res.statusCode);
      }
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
    }
  }

  @override
 Future refresh(String accessToken)async {
    try {
      var res = await http.post('$baseUrl/refresh',
     headers: {"Authorization":accessToken,}
      );
      if (res.statusCode == 200) {
        return res?.body;
      } else {
        print(res.statusCode);
      }
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
    }
  }

}
