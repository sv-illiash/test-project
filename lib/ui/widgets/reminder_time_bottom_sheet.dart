import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/widgets/main_button.dart';
import 'package:my_book_reloaded/ui/widgets/my_picker.dart' as picker;

class ReminderTimeBottomSheet extends StatelessWidget {
  const ReminderTimeBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Container(
            height: 4,
            width: 45,
            margin: EdgeInsets.only(bottom: 19.5, top: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                color: Theme.of(context).buttonColor),
          ),
          Text(
            "Mindfulness Reminders",
            style: TextStyle(
                color: Theme.of(context).buttonColor,
                fontSize: 22,
                height: 1.45,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 9.5,
          ),
          Text(
              "Improve sleep, enhance focus, and boost your "
              "quality of life by practicing mindfulness daily",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).buttonColor.withOpacity(0.8),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.42)),
          Container(
            height: 160,
            margin: EdgeInsets.only(top: 50, bottom: 65),
            width: 280,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: picker.CupertinoPicker(
                      itemExtent: 60,
                      diameterRatio: 1,
                      looping: true,
                      scrollController:
                          FixedExtentScrollController(initialItem: 0),
                      backgroundColor: Colors.transparent,
                      useMagnifier: true,
                      offAxisFraction: -0.2,
                      onSelectedItemChanged: (int) {
                        // index = int;
                        // onPickerChanged(int);
                      },
                      children: List.generate(
                          24,
                          (index) => Text(
                                (index + 1).toString().padLeft(2, "0"),
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 45,
                                    color: Theme.of(context).buttonColor),
                              ))),
                ),
                Text(":",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 45,
                        color: Theme.of(context).buttonColor)),
                Expanded(
                  child: picker.CupertinoPicker(
                      itemExtent: 60,
                      diameterRatio: 1,
                      looping: true,
                      offAxisFraction: 0.2,
                      scrollController:
                          FixedExtentScrollController(initialItem: 0),
                      backgroundColor: Colors.transparent,
                      useMagnifier: true,
                      onSelectedItemChanged: (int) {
                        // index = int;
                        // onPickerChanged(int);
                      },
                      children: List.generate(
                          60,
                          (index) => Text(
                                (index + 1).toString().padLeft(2, "0"),
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 45,
                                    color: Theme.of(context).buttonColor),
                              ))),
                ),
              ],
            ),
          ),
          Row(
            children: [
              CupertinoSwitch(
                  activeColor: Theme.of(context).toggleableActiveColor,
                  value: false,
                  onChanged: (value) => {}),
              SizedBox(
                width: 14,
              ),
              Expanded(
                child: Text(
                  "Reminder on my phone",
                  style: TextStyle(
                      color: Theme.of(context).buttonColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      height: 1.17),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CupertinoSwitch(
                  activeColor: Theme.of(context).toggleableActiveColor,
                  value: false,
                  onChanged: (value) => {}),
              SizedBox(
                width: 14,
              ),
              Expanded(
                child: Text(
                  "Add reminder to my calendar",
                  style: TextStyle(
                      color: Theme.of(context).buttonColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      height: 1.17),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          MainButton(
              text: "Set Reminder",
              onPressed: () {
                Navigator.pop(context);
              }),
          SizedBox(
            height: 43,
          ),
        ],
      ),
    );
  }
}
