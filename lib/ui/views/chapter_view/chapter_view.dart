import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reloaded/core/models/book_object.dart';
import 'package:my_book_reloaded/ui/views/chapter_view/chapter_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/my_app_bar.dart';
import 'package:my_book_reloaded/ui/widgets/my_scaffold.dart';
import 'package:stacked/stacked.dart';

import 'chapter_messages_body.dart';
import 'chapter_slider_body.dart';

class ChapterView extends StatefulWidget {
  final ChapterObject chapterObject;

  const ChapterView({Key key, this.chapterObject}) : super(key: key);

  @override
  _ChapterViewState createState() => _ChapterViewState();
}

class _ChapterViewState extends State<ChapterView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChapterViewModel>.reactive(
        viewModelBuilder: () => ChapterViewModel(),
        onModelReady: (model) => model.init(widget.chapterObject),
        builder: (buildContext, model, widget) {
          return MyScaffold(
              imageName: "selected_background.png",
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  MyAppBar(
                    title: model.chapterObject.chapter,
                    onBackPressed: model.onBackPressed,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 30),
                    padding: EdgeInsets.only(
                        top: 10, left: 16, bottom: 11, right: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context)
                            .secondaryHeaderColor
                            .withOpacity(0.5)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chapter / 5 min ",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .buttonColor
                                  .withOpacity(0.5),
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text("Work with Fear",
                            style: TextStyle(
                                color: Theme.of(context).buttonColor,
                                fontSize: 14,
                                height: 1.57,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "You last week reveiw",
                            style: TextStyle(
                                color: Theme.of(context).buttonColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        CupertinoButton(
                            onPressed: model.openFilter,
                            padding: EdgeInsets.all(20),
                            child: Image.asset(
                              "assets/filter.png",
                              color: Theme.of(context).buttonColor,
                              height: 16,
                              width: 16,
                            ))
                      ],
                    ),
                  ),
                  model.isMessagesType()
                      ? ChapterMessagesBody()
                      : ChapterSliderBody()
                ],
              ));
        });
  }
}
