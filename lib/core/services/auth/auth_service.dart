import 'package:flutter_session/flutter_session.dart';

abstract class AuthService {
  static final session = FlutterSession();

  Future<dynamic> registration(String email, String password);

  Future<dynamic> login(String email, String password);

  Future<dynamic> refresh(String accessToken);

  static setToken(String id,String token, String tokenType,int expiresIn) async {
    _AuthData data = _AuthData(id:id,token:token, tokenType: tokenType,expiresIn: expiresIn);
    await session.set('tokens', data);
  }

  static Future<Map<String, dynamic>> getToken() async {
    return await session.get('tokens');
  }
 /* static Future<Map<String, dynamic>> getAccessToken() async {
    return await session.get(getToken('tokens')).;
  }*/

  static removeToken() async {
    await session.prefs.clear();
  }
}

class _AuthData {
  String id;
  String token;
  String tokenType;
  int expiresIn;

  _AuthData({this.id, this.token, this.tokenType, this.expiresIn});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}