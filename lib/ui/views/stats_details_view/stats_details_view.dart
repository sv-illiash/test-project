import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/core/models/book_object.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';
import 'package:my_book_reloaded/ui/views/stats_details_view/stats_details_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/custom_tab_indicator.dart';
import 'package:my_book_reloaded/ui/widgets/my_app_bar.dart';
import 'package:my_book_reloaded/ui/widgets/my_scaffold.dart';
import 'package:my_book_reloaded/ui/widgets/my_sliver_widget.dart';
import 'package:stacked/stacked.dart';

class StatsDetailsView extends StatefulWidget {
  final BookObject statObject;

  const StatsDetailsView({Key key, this.statObject}) : super(key: key);

  @override
  _StatsDetailsViewState createState() => _StatsDetailsViewState();
}

class _StatsDetailsViewState extends State<StatsDetailsView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    bool isDark = Get.theme.brightness == Brightness.dark;
    return ViewModelBuilder<StatsDetailsViewModel>.reactive(
        viewModelBuilder: () => StatsDetailsViewModel(),
        onModelReady: (model) => model.init(this, widget.statObject),
        builder: (buildContext, model, widget) {
          return MyScaffold(
            imageName: "selected_background.png",
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedBuilder(
                  animation: model.animationController,
                  builder: (BuildContext context, Widget child) {
                    return MyAppBar(
                      backgroundColor: Theme.of(buildContext)
                          .bottomAppBarColor
                          .withOpacity(model.alpha.value),
                      title: model.statObject.title,
                      onBackPressed: model.onBackPressed,
                    );
                  },
                ),
                Expanded(
                  child: NestedScrollView(
                    controller: model.scrollController,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) => [
                      SliverPersistentHeader(
                          pinned: false,
                          delegate: MySliverWidget(
                              Container(
                                padding: EdgeInsets.only(
                                    top: 13, bottom: 27, left: 20, right: 20),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/${model.statObject.image}",
                                      height: 149,
                                      width: 97,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            model.statObject.title,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .buttonColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 22),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(model.statObject.author,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .buttonColor
                                                      .withOpacity(0.5),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              expandedHeight: 189)),
                      SliverPersistentHeader(
                          pinned: true,
                          delegate: MySliverWidget(
                              AnimatedBuilder(
                                animation: model.animationController,
                                builder: (BuildContext context, Widget child) {
                                  return Container(
                                    color: Theme.of(buildContext)
                                        .bottomAppBarColor
                                        .withOpacity(model.alpha.value),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: TabBar(
                                        isScrollable: true,
                                        indicator: CustomTabIndicator(),
                                        labelPadding: EdgeInsets.symmetric(
                                            horizontal: 16.5, vertical: 7),
                                        labelStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                        unselectedLabelColor: isDark
                                            ? MyColors.primary
                                            : MyColors.black,
                                        labelColor:
                                            Theme.of(context).buttonColor,
                                        controller: model.tabController,
                                        tabs: [
                                          Tab(
                                            text: "Week",
                                          ),
                                          Tab(
                                            text: "Month",
                                          ),
                                          Tab(
                                            text: "Year",
                                          )
                                        ]),
                                  );
                                },
                              ),
                              expandedHeight: 60))
                    ],
                    body: TabBarView(
                      controller: model.tabController,
                      children: [StatsTab(), StatsTab(), StatsTab()],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class StatsTab extends ViewModelWidget<StatsDetailsViewModel> {
  const StatsTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, StatsDetailsViewModel viewModel) {
    return Stack(
      children: [
        ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: viewModel.statObject.chapters.length,
          padding: EdgeInsets.only(right: 20, left: 20, top: 10),
          itemBuilder: (BuildContext context, int index) {
            ChapterObject chapterObject = viewModel.statObject.chapters[index];
            return StatsItem(
              chapterObject: chapterObject,
              topLine: index != 0,
              bottomLine: index != viewModel.statObject.chapters.length - 1,
            );
          },
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(context).padding.bottom + 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/Group 12007.png",
                  height: 71,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ))
      ],
    );
  }
}

class StatsItem extends ViewModelWidget<StatsDetailsViewModel> {
  final bool bottomLine;
  final bool topLine;
  final ChapterObject chapterObject;

  const StatsItem({
    Key key,
    @required this.chapterObject,
    this.bottomLine = true,
    this.topLine = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, StatsDetailsViewModel viewModel) {
    bool isDark = Get.theme.brightness == Brightness.dark;
    return Row(
      children: [
        Container(
          width: 54,
          height: 80,
          child: Stack(
            children: [
              Visibility(
                visible: topLine,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 20,
                    width: 1,
                    color: isDark ? Color(0xFF30343B) : MyColors.primary,
                  ),
                ),
              ),
              Visibility(
                visible: bottomLine,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 20,
                    width: 1,
                    color: isDark ? Color(0xFF30343B) : MyColors.primary,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 54,
                  margin: EdgeInsets.symmetric(vertical: 3),
                  width: 54,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(chapterObject.times,
                          style: TextStyle(
                              color: Theme.of(context).buttonColor,
                              fontWeight: FontWeight.w700,
                              height: 1.25,
                              fontSize: 20)),
                      Text("times",
                          style: TextStyle(
                              color:
                                  isDark ? Color(0xFFBFBFBF) : MyColors.black,
                              fontWeight: FontWeight.w400,
                              height: 1.1,
                              fontSize: 12)),
                    ],
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isDark ? Color(0xFF30343B) : MyColors.primary),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: FlatButton(
              onPressed: () => viewModel.openChapterMessagesView(chapterObject),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.zero,
              child: Container(
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).buttonColor.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    EdgeInsets.only(top: 10, left: 16, bottom: 11, right: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            chapterObject.chapter,
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
                          Text(chapterObject.title,
                              style: TextStyle(
                                  color: Theme.of(context).buttonColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                    Transform.rotate(
                        angle: 135,
                        child: Image.asset(
                          "assets/chevron-left.png",
                          height: 24,
                          width: 24,
                          color: MyColors.primary,
                        ))
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
