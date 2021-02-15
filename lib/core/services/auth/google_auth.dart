import 'package:google_sign_in/google_sign_in.dart';
import 'auth.dart';

class GoogleAuth implements Auth {
  @override
  Future<dynamic> signIn() async {
  await  GoogleSignIn().signIn();
  }

  @override
  Future<dynamic> signOut() async {
    return  GoogleSignIn().signOut();
  }
}
