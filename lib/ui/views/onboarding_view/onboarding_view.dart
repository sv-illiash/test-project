import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';
import 'package:my_book_reloaded/ui/views/onboarding_view/onboarding_details_view.dart';
import 'package:my_book_reloaded/ui/views/onboarding_view/onboarding_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/my_scaffold.dart';
import 'package:stacked/stacked.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      viewModelBuilder: () => OnboardingViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, widget) {
        return MyScaffold(
            resizeToAvoidBottomInset: false,
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: model.onPageChange,
                    controller: model.pageController,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: model.onboardingList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OnboardingDetailsView(
                        onboardingObject: model.onboardingList[index],
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 54, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            "Skip",
                            style: Get.textTheme.headline5,
                          ),
                          onPressed: model.openJoinUs),
                      FlatButton(
                          padding: EdgeInsets.all(18),
                          onPressed: model.nextPage,
                          color: MyColors.primary,
                          shape: CircleBorder(),
                          child: Image.asset(
                            "assets/arrow-right.png",
                            height: 30,
                            width: 30,
                          ))
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }
}
