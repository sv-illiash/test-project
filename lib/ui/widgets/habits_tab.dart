import 'package:flutter/material.dart';
import 'package:my_book_reloaded/core/models/book_object.dart';
import 'package:my_book_reloaded/ui/views/book_view/base_book_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/habit_item_widget.dart';
import 'package:my_book_reloaded/ui/widgets/main_button.dart';
import 'package:stacked/stacked.dart';

class HabitsTab extends ViewModelWidget<BaseBookViewModel> {
  const HabitsTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, BaseBookViewModel viewModel) {
    bool isBook = viewModel.bookObject.type == BookType.book;
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 90,
              left: 20,
              right: 20),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: !isBook,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Select time package:",
                      style: TextStyle(
                          fontSize: 14,
                          height: 1.17,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).buttonColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: viewModel.buildPackages(),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 12),
                itemCount: viewModel.bookObject.chapters.length,
                itemBuilder: (context, index) {
                  ChapterObject chapterObject =
                      viewModel.bookObject.chapters[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: HabitItem(
                      chapterObject: chapterObject,
                      isSelected: isBook
                          ? viewModel.selectedHabits.contains(index)
                          : false,
                      onPressed:
                          isBook ? () => viewModel.onHabitPressed(index) : null,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(context).padding.bottom + 40),
              child: MainButton(
                text: "Select Habits",
                onPressed: viewModel.onRemainderView,
              ),
            ))
      ],
    );
  }
}
