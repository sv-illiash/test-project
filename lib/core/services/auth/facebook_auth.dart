import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import 'auth.dart';

class FacebookAuth implements Auth {
  @override
  Future<dynamic> signIn() async {
   await FacebookLogin().logIn(['email']);
  }

  @override
  Future<dynamic> signOut() {
    return FacebookLogin().logOut();
  }
}
