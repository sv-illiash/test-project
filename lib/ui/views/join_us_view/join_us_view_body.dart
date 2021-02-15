import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/ui/views/join_us_view/join_us_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/main_button.dart';
import 'package:my_book_reloaded/ui/widgets/my_scaffold.dart';
import 'package:my_book_reloaded/ui/widgets/term_and_cond_widget.dart';
import 'package:stacked/stacked.dart';

class JoinUsViewBody extends ViewModelWidget<JoinUsViewModel> {
  @override
  Widget build(BuildContext context, JoinUsViewModel model) {
    String theme = Get.theme.brightness == Brightness.dark ? "dark" : "light";
    return MyScaffold(
      resizeToAvoidBottomInset: false,
      padding: EdgeInsets.only(
          left: 21,
          right: 21,
          bottom: MediaQuery.of(context).padding.bottom + 50,
          top: MediaQuery.of(context).padding.top),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(child: Container()),
          Flexible(flex: 2, child: Image.asset("assets/$theme/join_us.png")),
          Container(
              margin: EdgeInsets.only(top: 37.8),
              child: Text(
                "Join Us",
                textAlign: TextAlign.center,
                style: Get.textTheme.headline1,
              )),
          Container(
              margin: EdgeInsets.only(top: 14.5),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting",
                textAlign: TextAlign.center,
                style: Get.textTheme.bodyText1,
              )),
          SizedBox(
            height: 22.5,
          ),
          MainButton(
            text: "Sign Up",
            onPressed: model.openSignUp,
          ),
          SizedBox(
            height: 17,
          ),
          CupertinoButton(
              minSize: 18.75,
              padding: EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  style: Get.textTheme.button,
                ),
              ),
              onPressed: model.openLogin),
          SizedBox(
            height: 15,
          ),
          TermAndCondWidget(),
        ],
      ),
    );
  }
}
