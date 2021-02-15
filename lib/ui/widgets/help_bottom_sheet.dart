import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/ui/widgets/audio_player_widget.dart';
import 'package:my_book_reloaded/ui/widgets/main_button.dart';

class HelpBottomSheet extends StatelessWidget {
  const HelpBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.theme.brightness == Brightness.dark;
    return Container(
      height: 532,
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
            "Why you need to do list of 3 destructive habits",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).buttonColor,
                fontSize: 22,
                height: 1.45,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 9,
          ),
          Text(
              "These are some of the benefits of meditation: "
              "Improved concentration – A clear mind makes you more productive, "
              "especially in creative disciplines like writing. ... "
              "The reason is that meditation reduces stress levels and alleviates anxiety. "
              "If we can reduce stress, many health benefits follow",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).buttonColor.withOpacity(0.8),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.42)),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: isDark?Color(0xFF393C43):Color(0xffFFF1E4),
                borderRadius: BorderRadius.circular(8)),
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: AudioPlayerWidget(
              iconsOpacity: 0.3,
            ),
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
