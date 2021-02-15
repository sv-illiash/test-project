import 'package:cupertino_stackview/cupertino_stackview.dart';
import 'package:cupertino_stackview/misc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/views/login_view/login_view_body.dart';
import 'package:my_book_reloaded/ui/views/login_view/login_view_model.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        onModelReady: (model) => model.init(context),
        builder: (buildContext, model, widget) {
          return WillPopScope(
            onWillPop: () async {
              cupertinoStackViewController.back();
              return false;
            },
            child: CupertinoStackView(
                false, "Login", LoginViewBody(), Colors.black,
                isDismissible: true, radius: Radius.circular(16)),
          );
        });
  }
}
