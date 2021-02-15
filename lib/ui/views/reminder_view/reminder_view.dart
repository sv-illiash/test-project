import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/core/models/reminder_object.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';
import 'package:my_book_reloaded/ui/views/reminder_view/reminder_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/main_button.dart';
import 'package:my_book_reloaded/ui/widgets/my_app_bar.dart';
import 'package:stacked/stacked.dart';

class ReminderView extends StatefulWidget {
  @override
  _ReminderViewState createState() => _ReminderViewState();
}

class _ReminderViewState extends State<ReminderView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReminderViewModel>.reactive(
        viewModelBuilder: () => ReminderViewModel(),
        builder: (buildContext, model, widget) {
          return Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    MyAppBar(
                      title: "A Zero Waste Life in thirty Days",
                      border: false,
                      onBackPressed: model.onBackPressed,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(
                            top: 33,
                            left: 20,
                            right: 20,
                            bottom:
                                MediaQuery.of(context).padding.bottom + 100),
                        child: Column(
                          children: [
                            //TODO Set same time in all days button
                            /*MainButton(
                              text: "10:00 AM",
                              enable: model.isAllDays,
                              onPressed: model.openRemainderBottomSheet,
                            ),*/
                            /*SizedBox(
                              height: 19,
                            ),*/
                           /* Row(
                              children: [
                                CupertinoSwitch(
                                    activeColor:
                                        Theme.of(context).toggleableActiveColor,
                                    value: model.isAllDays,
                                    onChanged: model.allDaysValueChange),
                                SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  "Set same time in all days",
                                  style: TextStyle(
                                      color: Theme.of(context).buttonColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      height: 1.17),
                                ),
                              ],
                            ),*/
                            /*SizedBox(
                              height: 38,
                            ),*/
                            Column(
                              children: model.buildDaysList(),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: 14,
                        bottom: MediaQuery.of(context).padding.bottom + 44),
                    child: FlatButton(
                        padding: EdgeInsets.all(18),
                        onPressed: model.goToHome,
                        color: MyColors.primary,
                        shape: CircleBorder(),
                        child: Image.asset(
                          "assets/arrow-right.png",
                          height: 30,
                          width: 30,
                        )),
                  ),
                )
              ],
            ),
          );
        });
  }
}

class ReminderWidget extends ViewModelWidget<ReminderViewModel> {
  final ReminderObject reminderObject;

  const ReminderWidget({
    Key key,
    this.reminderObject,
  }) : super(key: key);

  Color getBackgroundColor(bool isDark) {
    if (reminderObject.selected) {
      return isDark ? Color(0xFFFEFEFE) : Color(0xFFFFF1E4);
    } else {
      return isDark ? Color(0xFF272B31) : Color(0xFFFFFFFF);
    }
  }

  Color getTextColor(bool isDark) {
    if (reminderObject.selected) {
      return MyColors.black;
    } else {
      return isDark ? Colors.white : MyColors.black;
    }
  }

  Color getButtonTextColor(bool isDark) {
    if (reminderObject.selected) {
      return isDark ? Colors.white : MyColors.black;
    } else {
      return MyColors.black;
    }
  }

  Color getBorderColor(bool isDark) {
    if (reminderObject.selected) {
      return isDark ? Color(0xFFFEFEFE) : Color(0xFFEBECEC);
    } else {
      return isDark ? Color(0xFF272B31) : Color(0xFFEBECEC);
    }
  }

  Color getButtonColor(bool isDark) {
    if (reminderObject.selected) {
      return isDark ? Color(0xFF21242A) : MyColors.primary;
    } else {
      return MyColors.primary;
    }
  }

  @override
  Widget build(BuildContext context, ReminderViewModel viewModel) {
    bool isDark = Get.theme.brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.only(bottom: 19),
      padding: EdgeInsets.only(right: 20, left: 20, top: 18, bottom: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: getBackgroundColor(isDark),
          border: Border.all(color: getBorderColor(isDark))),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  reminderObject.dayName,
                  style: TextStyle(
                      color: getTextColor(isDark),
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      height: 1.33),
                ),
              ),
              CupertinoSwitch(
                  activeColor: Theme.of(context).toggleableActiveColor,
                  value: reminderObject.selected,
                  onChanged: (value) =>
                      viewModel.selectDay(reminderObject, value)),
            ],
          ),
          SizedBox(
            height: 13,
          ),
          MainButton(
            text: "10:00 AM",
            color: getButtonColor(isDark),
            textColor: getButtonTextColor(isDark),
            onPressed: viewModel.openRemainderBottomSheet,
          ),
        ],
      ),
    );
  }
}
