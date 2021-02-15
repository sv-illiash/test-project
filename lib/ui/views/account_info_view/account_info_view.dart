import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/widgets/main_button.dart';
import 'package:my_book_reloaded/ui/widgets/my_app_bar.dart';
import 'package:my_book_reloaded/ui/widgets/my_text_field.dart';
import 'package:stacked/stacked.dart';

import 'account_info_view_model.dart';

class AccountInfoView extends StatefulWidget {
  @override
  _AccountInfoViewState createState() => _AccountInfoViewState();
}

class _AccountInfoViewState extends State<AccountInfoView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountInfoViewModel>.reactive(
        viewModelBuilder: () => AccountInfoViewModel(),
        builder: (buildContext, model, widget) {
          return Scaffold(
            body: Column(
              children: [
                MyAppBar(
                  title: "Account Info",
                  onBackPressed: model.onBackPressed,
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                    physics: BouncingScrollPhysics(),
                    children: [
                      MyTextField(
                        margin: EdgeInsets.only(bottom: 14),
                        hintText: "Enter your name",
                        labelText: "Name",
                      ),
                      MyTextField(
                        margin: EdgeInsets.only(bottom: 14),
                        hintText: "Enter your email",
                        labelText: "Email",
                      ),
                      MyTextField(
                          hintText: "Enter password",
                          labelText: "Password",
                          margin: EdgeInsets.only(bottom: 19)),
                      MainButton(
                        text: "Update",
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
