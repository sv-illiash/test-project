import 'package:cupertino_stackview/cupertino_stackview.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:my_book_reloaded/ui/views/forgot_password_view/forgot_password_view.dart';
import 'package:my_book_reloaded/ui/views/join_us_view/join_us_view.dart';
import 'package:my_book_reloaded/ui/views/login_view/login_view.dart';
import 'package:my_book_reloaded/ui/views/new_password_view/new_password_view.dart';
import 'package:my_book_reloaded/ui/views/sign_up_view/sign_up_view.dart';
import 'package:stacked/stacked.dart';

class JoinUsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  BuildContext _context;

  void init(BuildContext context) {
    cupertinoStackViewController = CupertinoStackViewController(
      _navigationService.navigatorKey,
      {
        "JoinUs": (BuildContext context, dynamic parameters) {
          return JoinUsView();
        },
        "Login": (BuildContext context, dynamic parameters) {
          return LoginView();
        },
        "ForgotPassword": (BuildContext context, dynamic parameters) {
          return ForgotPasswordView();
        },
        "SignUp": (BuildContext context, dynamic parameters) {
          return SignUpView();
        },
        "NewPassword": (BuildContext context, dynamic parameters) {
          return NewPasswordView();
        },
      },
    );
    _context = context;
    cupertinoStackViewController.initialise(
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);
  }

  openLogin() {
    cupertinoStackViewController.navigate("Login", _context, null);
  }

  openNewPassword() {
    cupertinoStackViewController.navigate("NewPassword", _context, null);
  }

  openSignUp() {
    cupertinoStackViewController.navigate("SignUp", _context, null);
  }
}
