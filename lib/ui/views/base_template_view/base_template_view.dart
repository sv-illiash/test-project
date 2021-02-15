import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/views/base_template_view/base_template_view_model.dart';
import 'package:my_book_reloaded/ui/views/base_template_view/slider_template_view.dart';
import 'package:my_book_reloaded/ui/widgets/my_app_bar.dart';
import 'package:my_book_reloaded/ui/widgets/my_scaffold.dart';
import 'package:stacked/stacked.dart';

class BaseTemplateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseTemplateViewModel>.reactive(
        viewModelBuilder: () => BaseTemplateViewModel(),
        onModelReady: (model) => model.init(),
        builder: (buildContext, model, widget) {
          return MyScaffold(
            imageName: "selected_background.png",
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                MyAppBar(
                  title: "",
                  onBackPressed: model.onBackPressed,
                  onRightButtonPressed: model.openHelpBottomSheet,
                  rightButtonIcon: "assets/icons/info_icon.png",
                  border: false,
                ),
                LinearProgressIndicator(
                  backgroundColor:
                      Theme.of(context).buttonColor.withOpacity(0.3),
                  minHeight: 2,
                  value: model.progress,
                ),
                Expanded(
                  child: PageView.builder(
                    itemCount: 5,
                    controller: model.pageController,
                    itemBuilder: (context, index) {
                      return SliderTemplateView();
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
