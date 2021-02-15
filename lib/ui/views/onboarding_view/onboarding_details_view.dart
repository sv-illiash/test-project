import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/core/models/onboarding_object.dart';
import 'package:my_book_reloaded/ui/views/onboarding_view/onboarding_view_model.dart';
import 'package:stacked/stacked.dart';

class OnboardingDetailsView extends ViewModelWidget<OnboardingViewModel> {
  final OnboardingObject onboardingObject;

  OnboardingDetailsView({this.onboardingObject});

  @override
  Widget build(BuildContext context, OnboardingViewModel viewModel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(child: SizedBox()),
          Flexible(
              flex: 2,
              child: Image.asset("assets/${onboardingObject.imagePath}")),
          Container(
              margin: EdgeInsets.only(top: 40),
              height: 80,
              child: Text(onboardingObject.title,
                  textAlign: TextAlign.center, style: Get.textTheme.headline2)),
          Container(
              margin: EdgeInsets.only(top: 12),
              child: Text(
                onboardingObject.description,
                textAlign: TextAlign.center,
                style: Get.textTheme.bodyText1,
              ))
        ],
      ),
    );
  }
}
