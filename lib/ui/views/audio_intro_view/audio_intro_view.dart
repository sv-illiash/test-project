import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/ui/widgets/audio_player_widget.dart';
import 'package:my_book_reloaded/ui/widgets/main_button.dart';
import 'package:my_book_reloaded/ui/widgets/my_app_bar.dart';
import 'package:my_book_reloaded/ui/widgets/my_scaffold.dart';
import 'package:stacked/stacked.dart';

import 'audio_intro_view_model.dart';

class AudioIntroView extends StatefulWidget {
  @override
  _AudioIntroViewState createState() => _AudioIntroViewState();
}

class _AudioIntroViewState extends State<AudioIntroView> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Get.theme.brightness == Brightness.dark;
    return ViewModelBuilder<AudioIntroViewModel>.reactive(
        viewModelBuilder: () => AudioIntroViewModel(),
        builder: (buildContext, model, widget) {
          return MyScaffold(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                MyAppBar(
                  title: "Listen Chapter Audio",
                  onBackPressed: model.onBackPressed,
                  onRightButtonPressed: model.openHelpBottomSheet,
                  rightButtonIcon: "assets/icons/info_icon.png",
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Repeat think and grow",
                  style: TextStyle(
                      color: Theme.of(context).buttonColor,
                      height: 1.45,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 25,
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    constraints: BoxConstraints(maxHeight: 200),
                    child: AspectRatio(
                      aspectRatio: 145 / 200,
                      child: Image.asset(
                        "assets/image 3.png",
                        height: 200,
                        fit: BoxFit.cover,
                        width: 145,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 27, left: 20, right: 20),
                  child: AudioPlayerWidget(
                    iconsOpacity: 0.2,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.only(
                        left: 20, right: 10, top: 16, bottom: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: isDark ? Color(0xFF33363C) : Color(0xFFFFFAF6)),
                    child: Column(
                      children: [
                        Text(
                          "Transcript",
                          style: TextStyle(
                              color: Theme.of(context).buttonColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              height: 1.33),
                        ),
                        Expanded(
                          child: Scrollbar(
                            isAlwaysShown: true,
                            thickness: 4,
                            controller: model.scrollController,
                            radius: Radius.circular(6),
                            child: SingleChildScrollView(
                              controller: model.scrollController,
                              child: Text(
                                  "The purpose of today's exercise is simply to make you aware of your present "
                                  "emotional patterns and get you to utilize as many of "
                                  "the above-listed skills as necessary to guarantee that "
                                  "you shape your own emotional destiny daily",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .buttonColor
                                          .withOpacity(0.7),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 1.7)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MainButton(
                    text: "Skip",
                    onPressed: model.onOpenBaseTemplateView,
                  ),
                )
              ],
            ),
          );
        });
  }
}
