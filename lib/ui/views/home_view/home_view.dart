import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/core/models/book_object.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';
import 'package:my_book_reloaded/ui/views/home_view/home_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/habit_item_widget.dart';
import 'package:my_book_reloaded/ui/widgets/home_view_item_widget.dart';
import 'package:my_book_reloaded/ui/widgets/my_scaffold.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 3;
    double ration = 256 / 130;
    bool isDark = Get.theme.brightness == Brightness.dark;
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.init(this),
        builder: (buildContext, model, widget) {
          return MyScaffold(
            imageName: "selected_background.png",
            loading: model.isBusy,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Home",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).buttonColor,
                              fontSize: 40,
                              height: 1.2),
                        ),
                      ),
                      FlatButton(
                          onPressed: model.onEditSwitch,
                          color: Theme.of(context).secondaryHeaderColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Text(model.isEdit ? "Save" : "Edit",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).buttonColor,
                                  fontSize: 14)))
                    ],
                  ),
                ),
                Expanded(
                    child: NestedScrollView(
                  physics: BouncingScrollPhysics(),
                  controller: model.scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: Center(
                        child: Container(
                          height: 140,
                          width: 140,
                          margin: EdgeInsets.only(
                              top: 17.68, bottom: 30, right: 20, left: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color:
                                isDark ? Color(0xFF31343B) : Color(0xFFFFFAF6),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "31",
                                style: TextStyle(
                                    fontSize: 44,
                                    height: 1.2,
                                    color: MyColors.primary,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Text("min/day",
                                  style: TextStyle(
                                      fontSize: 20,
                                      height: 1.2,
                                      color: Theme.of(context).buttonColor,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: width * ration,
                        child: PageView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: model.pageItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            List<BookObject> list = model.pageItems[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: list
                                    .map((bookObject) => Expanded(
                                          child: HomeViewItemWidget(
                                            bookObject: bookObject,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Visibility(
                        visible: model.isEdit,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: CupertinoButton(
                              onPressed: model.onRemainderView,
                              padding: EdgeInsets.zero,
                              minSize: 10,
                              child: Text(
                                "Edit the daily reminder",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    height: 2,
                                    decoration: TextDecoration.underline,
                                    color: Theme.of(context).buttonColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  body: ChaptersList(),
                )),
              ],
            ),
          );
        });
  }
}

class ChaptersList extends ViewModelWidget<HomeViewModel> {
  const ChaptersList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return ListView.builder(
        itemCount: viewModel.items[0].chapters.length,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + 10,
            left: 20,
            top: 20,
            right: 20),
        itemBuilder: (BuildContext context, int index) {
          ChapterObject chapterObject = viewModel.items[0].chapters[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: HabitItem(
              onPressed: viewModel.openChapter,
              chapterObject: chapterObject,
              isEdited: viewModel.isEdit,
              isSelected: false,
            ),
          );
        });
  }
}
