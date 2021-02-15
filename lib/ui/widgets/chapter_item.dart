import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';

enum ChapterMessageType { text, audio }

class ChapterItem extends StatelessWidget {
  final ChapterMessageType type;
  final String day;
  final bool line;

  const ChapterItem({
    Key key,
    this.type = ChapterMessageType.text,
    this.day = "Monday",
    this.line = true,
  }) : super(key: key);

  Widget buildBody() {
    switch (type) {
      case ChapterMessageType.text:
        return ChapterTextBody();
        break;
      case ChapterMessageType.audio:
        return ChapterAudioBody();
        break;
      default:
        return ChapterTextBody();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                Container(
                  height: 13,
                  width: 13,
                  margin: EdgeInsets.only(top: 3, bottom: 8.76),
                  decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor.withOpacity(0.1),
                      shape: BoxShape.circle),
                ),
                Visibility(
                  visible: line,
                  child: Flexible(
                    child: Container(
                      width: 1,
                      color: Theme.of(context).buttonColor.withOpacity(0.1),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 14,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(day,
                      style: TextStyle(
                          color: Theme.of(context).buttonColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height: 1.17)),
                  buildBody()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CupertinoButton(
                  onPressed: () {},
                  child: Image.asset(
                    "assets/trash.png",
                    width: 18,
                    height: 18,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class ChapterAudioBody extends StatelessWidget {
  const ChapterAudioBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).secondaryHeaderColor),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      margin: EdgeInsets.only(bottom: 25, top: 9),
      child: Row(
        children: [
          FlatButton(
              color: MyColors.primary,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              onPressed: () {},
              child: Container(
                  height: 25,
                  width: 25,
                  padding:
                      EdgeInsets.only(top: 7, bottom: 7, left: 8, right: 6),
                  child: Image.asset(
                    "assets/media-play-symbol.png",
                    color: MyColors.black,
                  ))),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    "assets/audio_track.png",
                    fit: BoxFit.fitWidth,
                    color: Theme.of(context).buttonColor,
                    height: 13,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "05:29",
                  style: TextStyle(
                      color: Theme.of(context).buttonColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      height: 1.01),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChapterTextBody extends StatelessWidget {
  const ChapterTextBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).secondaryHeaderColor),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      margin: EdgeInsets.only(bottom: 25, top: 9),
      child: Text(
        "Amet minim mollit non deserunt ullamco est sit aliqua"
        " dolor do amet sint. Velit officia consequat "
        "duis enim velit mollit. Exercitation veniam.",
        style: TextStyle(
            color: Theme.of(context).buttonColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 1.57),
      ),
    );
  }
}
