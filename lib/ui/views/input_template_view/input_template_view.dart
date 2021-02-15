import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/widgets/my_app_bar.dart';
import 'package:my_book_reloaded/ui/widgets/my_scaffold.dart';
import 'package:stacked/stacked.dart';
import 'input_template_slider_view.dart';
import 'input_template_view_model.dart';

class InputTemplateView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InputTemplateViewModel>.reactive(
        viewModelBuilder: () => InputTemplateViewModel(),
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
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    controller: model.pageController,
                    itemBuilder: (context, index) {
                      return InputTemplateSliderView();
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}