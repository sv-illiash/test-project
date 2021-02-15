import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/views/chapter_view/chapter_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/chapter_item.dart';
import 'package:stacked/stacked.dart';

class ChapterMessagesBody extends ViewModelWidget<ChapterViewModel> {
  @override
  Widget build(BuildContext context, ChapterViewModel viewModel) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 18, bottom: 15, top: 15),
        itemBuilder: (BuildContext context, int index) {
          return ChapterItem(
            line: index != 3,
            type: index % 2 == 0
                ? ChapterMessageType.text
                : ChapterMessageType.audio,
          );
        },
      ),
    );
  }
}
