import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';
import 'package:my_book_reloaded/ui/widgets/input_template_icon_item_widget.dart';
import 'package:my_book_reloaded/ui/widgets/main_button.dart';
import 'package:my_book_reloaded/ui/widgets/my_text_field.dart';
import 'package:my_book_reloaded/ui/widgets/timer_widget.dart';
import 'package:stacked/stacked.dart';
import 'input_template_view_model.dart';
import 'package:get/get.dart';

class InputTemplateSliderView extends ViewModelWidget<InputTemplateViewModel> {
  const InputTemplateSliderView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, InputTemplateViewModel viewModel) {
    bool isDark = Get.theme.brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        children: [
          Text(
            "Make list of 3 things you want to achive and think about it   ",
            style: TextStyle(
                fontSize: 22,
                height: 1.45,
                color: Theme.of(context).buttonColor,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: TimerWidget(
              radius: 145,
            ),
          ),
          Container(
            padding: EdgeInsets.all(26.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color:
                    isDark ? const Color(0xff272B31) : const Color(0xffFFFAF6)),
            child: Column(
              children: [
                Text(
                  "Number 1",
                  style: TextStyle(
                      color: Theme.of(context).buttonColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.33),
                ),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InputTemplateIconItemsWidget(
                          index: 1,
                          selectedIcon:
                              "assets/input_template_icons/edit_selected.png",
                          unselectedIcon:
                              "assets/input_template_icons/edit_unselected.png",
                        ),
                        InputTemplateIconItemsWidget(
                          index: 2,
                          selectedIcon:
                              "assets/input_template_icons/mic_selected.png",
                          unselectedIcon:
                              "assets/input_template_icons/mic_unselected.png",
                        ),
                      ]),
                ),

                Visibility(
                    visible: viewModel.selectedIndex == 1,
                    child: Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: MyTextField.multiline(
                            hintText: 'Type answer',
                          )),
                    )),

                // TODO audio record messagge
                Visibility(
                    visible: viewModel.selectedIndex == 2,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: MyColors.primary)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/input_template_icons/clouse.png",
                              height: 23,
                              width: 23,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Image.asset(
                              "assets/input_template_icons/timer.png",
                              height: 22,
                              width: 70,
                            ),
                            Expanded(child: SizedBox()),
                            Image.asset(
                              "assets/input_template_icons/send.png",
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          MainButton(text: "Next", onPressed: viewModel.onNextPage)
        ],
      ),
    );
  }
}

