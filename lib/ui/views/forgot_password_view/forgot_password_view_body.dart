import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';
import 'package:my_book_reloaded/ui/views/forgot_password_view/forgot_password_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/main_button.dart';
import 'package:my_book_reloaded/ui/widgets/my_app_bar.dart';
import 'package:my_book_reloaded/ui/widgets/my_text_field.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordViewBody extends ViewModelWidget<ForgotPasswordViewModel> {
  @override
  Widget build(BuildContext context, ForgotPasswordViewModel viewModel) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 4,
            width: 45,
            margin: EdgeInsets.only(bottom: 14, top: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                color: Theme.of(context).buttonColor),
          ),
          MyAppBar(
            title: "",
            padding: EdgeInsets.only(bottom: 8),
            onBackPressed: viewModel.onBackPressed,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              physics: BouncingScrollPhysics(),
              children: [
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).buttonColor,
                      fontSize: 22,
                      height: 1.17),
                ),
                SizedBox(
                  height: 11.5,
                ),
                Text(
                    "Enter your email and we’ll send a you a link to reset your password.",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: MyColors.gray3,
                        fontSize: 14,
                        height: 1.57)),
                MyTextField(
                  margin: EdgeInsets.only(bottom: 20, top: 18.42),
                  hintText: "Enter your email",
                  labelText: "Email",
                ),
                MainButton(
                  text: "Submit",
                  onPressed: viewModel.openSuccessView,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
