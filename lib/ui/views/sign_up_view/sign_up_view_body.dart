import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/ui/views/sign_up_view/sign_up_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/main_button.dart';
import 'package:my_book_reloaded/ui/widgets/my_text_field.dart';
import 'package:my_book_reloaded/ui/widgets/or_line_widget.dart';
import 'package:my_book_reloaded/ui/widgets/social_button.dart';
import 'package:my_book_reloaded/ui/widgets/term_and_cond_widget.dart';
import 'package:stacked/stacked.dart';

class SignUpViewBody extends ViewModelWidget<SignUpViewModel> {
  @override
  Widget build(BuildContext context, SignUpViewModel viewModel) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 4,
            width: 45,
            margin: EdgeInsets.only(bottom: 14.5, top: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                color: Theme.of(context).buttonColor),
          ),
          Text(
            "Sign Up",
            style: Get.textTheme.bodyText1.copyWith(height: 1.17),
          ),
          Container(
            margin: EdgeInsets.only(top: 11.5),
            height: 0.7,
            width: double.infinity,
            color: Theme.of(context).buttonColor.withOpacity(0.1),
          ),
          Expanded(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  MyTextField(
                    margin: EdgeInsets.only(
                        left: 19, right: 19, bottom: 14, top: 26.3),
                    controller: viewModel.emailController,
                    hintText: "Enter your email",
                    labelText: "Email",
                  ),
                  MyTextField(
                      controller: viewModel.passwordController,
                      hintText: "Enter password",
                      obscureText: true,
                      labelText: "Password",
                      margin: EdgeInsets.only(left: 19, right: 19, bottom: 19)),
                  Padding(
                    padding: EdgeInsets.only(left: 19, right: 19, bottom: 35),
                    child: MainButton(
                      text: "Register",
                      onPressed: viewModel.register,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 19, right: 19, bottom: 30),
                    child: OrLineWidget(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(onPressed: viewModel.loginInWithFaceBook),
                      SizedBox(
                        width: 15,
                      ),
                      SocialButton(
                        iconHeight: 24,
                        iconWidth: 24,
                        image: "assets/google-plus.png",
                        onPressed: viewModel.loginInWithGoogle,
                      )
                    ],
                  ),
                ])),
                SliverFillRemaining(
                  hasScrollBody: false,
                  fillOverscroll: false,
                  child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.bottomCenter,
                      child: TermAndCondWidget()),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
