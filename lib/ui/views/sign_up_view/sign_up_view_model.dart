import 'package:cupertino_stackview/misc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/app/router.gr.dart';
import 'package:my_book_reloaded/core/services/auth/auth_service.dart';
import 'package:my_book_reloaded/core/services/auth/facebook_auth.dart';
import 'package:my_book_reloaded/core/services/auth/google_auth.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:stacked/stacked.dart';

class SignUpViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  var authInfo;

  void init(BuildContext context) {
    cupertinoStackViewController.initialise(
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);
  }

  void loginInWithGoogle() async {
    await GoogleAuth().signIn();
    openMainView();
  }

  void loginInWithFaceBook() async {
    await FacebookAuth().signIn();
    openMainView();
  }

  void openMainView() {
    _navigationService.pushNamedAndRemoveUntil(Routes.MainView,
        predicate: (route) => false);
  }

  void register() async {
    String email = emailController.text;
    String password = passwordController.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      final res = await _authService.registration(email, password);
    } else {
      Get.log("Email or Password is empty", isError: true);
    }

    // authInfo = AuthService();
    // await final data =  AuthService().registration(email, password);
    //await final data= User.fromJson(res);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
