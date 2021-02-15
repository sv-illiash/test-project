import 'package:cupertino_stackview/cupertino_stackview.dart';
import 'package:cupertino_stackview/misc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/views/new_password_view/new_password_view_body.dart';
import 'package:my_book_reloaded/ui/views/new_password_view/new_password_view_model.dart';
import 'package:stacked/stacked.dart';

class NewPasswordView extends StatefulWidget {
  @override
  _NewPasswordViewState createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  @override
  Widget build(BuildContext context) {
    cupertinoStackViewController.initialise(
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);
    return ViewModelBuilder<NewPasswordViewModel>.reactive(
        viewModelBuilder: () => NewPasswordViewModel(),
        builder: (buildContext, model, widget) {
          return WillPopScope(
            onWillPop: () async {
              cupertinoStackViewController.back();
              return false;
            },
            child: CupertinoStackView(
                false, "NewPassword", NewPasswordViewBody(), Colors.black,
                isDismissible: true, radius: Radius.circular(16)),
          );
        });
  }
}
