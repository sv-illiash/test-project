import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/core/models/book_object.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';
import 'package:my_book_reloaded/ui/views/book_view/base_book_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/about_tab.dart';
import 'package:my_book_reloaded/ui/widgets/custom_tab_indicator.dart';
import 'package:my_book_reloaded/ui/widgets/habits_tab.dart';
import 'package:my_book_reloaded/ui/widgets/my_app_bar.dart';
import 'package:my_book_reloaded/ui/widgets/my_scaffold.dart';
import 'package:my_book_reloaded/ui/widgets/my_sliver_widget.dart';
import 'package:stacked/stacked.dart';

class BaseBookView extends StatefulWidget {
  final BookObject bookObject;

  const BaseBookView({Key key, @required this.bookObject}) : super(key: key);

  @override
  _BaseBookViewState createState() => _BaseBookViewState();
}

class _BaseBookViewState extends State<BaseBookView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    bool isDark = Get.theme.brightness == Brightness.dark;
    return ViewModelBuilder<BaseBookViewModel>.reactive(
        viewModelBuilder: () => BaseBookViewModel(),
        onModelReady: (model) => model.init(this, widget.bookObject),
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
                      title: model.bookObject.title,
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
                                    Hero(
                                      tag: model.bookObject.image +
                                          model.bookObject.title,
                                      child: Image.asset(
                                        "assets/${model.bookObject.image}",
                                        height: 149,
                                        width: 97,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 11,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            model.bookObject.title,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .buttonColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 22),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(model.bookObject.author ?? "",
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
                                    color: Theme.of(context)
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
                                            text: "Habits",
                                          ),
                                          Tab(
                                            text: model.getAboutName(),
                                          )
                                        ]),
                                  );
                                },
                              ),
                              expandedHeight: 60))
                    ],
                    body: TabBarView(
                      controller: model.tabController,
                      children: [HabitsTab(), AboutTab()],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
