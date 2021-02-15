import 'package:cupertino_stackview/cupertino_stackview.dart';
import 'package:cupertino_stackview/misc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/views/forgot_password_view/forgot_password_view_body.dart';
import 'package:my_book_reloaded/ui/views/forgot_password_view/forgot_password_view_model.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordView extends StatefulWidget {
  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    cupertinoStackViewController.initialise(
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
        viewModelBuilder: () => ForgotPasswordViewModel(),
        builder: (buildContext, model, widget) {
          return WillPopScope(
            onWillPop: () async {
              cupertinoStackViewController.back();
              return false;
            },
            child: CupertinoStackView(
                false, "ForgotPassword", ForgotPasswordViewBody(), Colors.black,
                isDismissible: true, radius: Radius.circular(16)),
          );
        });
  }
}
