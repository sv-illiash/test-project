import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';
import 'package:my_book_reloaded/ui/views/new_password_view/new_password_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/main_button.dart';
import 'package:my_book_reloaded/ui/widgets/my_text_field.dart';
import 'package:stacked/stacked.dart';

class NewPasswordViewBody extends ViewModelWidget<NewPasswordViewModel> {
  @override
  Widget build(BuildContext context, NewPasswordViewModel viewModel) {
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
            "New password",
            style: Get.textTheme.bodyText1.copyWith(height: 1.17),
          ),
          Container(
            margin: EdgeInsets.only(top: 11.5),
            height: 0.7,
            width: double.infinity,
            color: Theme.of(context).buttonColor.withOpacity(0.1),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverList(
                      delegate: SliverChildListDelegate([
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "New Password",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).buttonColor,
                          fontSize: 22,
                          height: 1.17),
                    ),
                    SizedBox(
                      height: 11.5,
                    ),
                    Text("Create new password",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: MyColors.gray3,
                            fontSize: 14,
                            height: 1.57)),
                    MyTextField(
                      margin: EdgeInsets.only(bottom: 14, top: 26.3),
                      hintText: "Enter new password",
                      obscureText: true,
                      labelText: "New password",
                    ),
                    MyTextField(
                        hintText: "Renter new password",
                        labelText: "Confirm new password",
                        obscureText: true,
                        margin: EdgeInsets.only(bottom: 19)),
                    Padding(
                      padding: EdgeInsets.only(bottom: 35),
                      child: MainButton(
                        text: "Create the new password",
                        onPressed: viewModel.openSuccessView,
                      ),
                    ),
                  ])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
