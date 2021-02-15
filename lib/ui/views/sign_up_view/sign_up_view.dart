import 'package:cupertino_stackview/cupertino_stackview.dart';
import 'package:cupertino_stackview/misc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/views/sign_up_view/sign_up_view_body.dart';
import 'package:my_book_reloaded/ui/views/sign_up_view/sign_up_view_model.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        viewModelBuilder: () => SignUpViewModel(),
        onModelReady: (model) => model.init(context),
        builder: (buildContext, model, widget) {
          return WillPopScope(
            onWillPop: () async {
              cupertinoStackViewController.back();
              return false;
            },
            child: CupertinoStackView(
                false, "SignUp", SignUpViewBody(), Colors.black,
                isDismissible: true, radius: Radius.circular(16)),
          );
        });
  }
}
