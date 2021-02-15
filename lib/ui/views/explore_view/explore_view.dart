import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reloaded/core/models/book_object.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';
import 'package:my_book_reloaded/ui/views/explore_view/explore_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/category_item_widget.dart';
import 'package:my_book_reloaded/ui/widgets/my_scaffold.dart';
import 'package:my_book_reloaded/ui/widgets/my_sliver_widget.dart';
import 'package:my_book_reloaded/ui/widgets/my_text_field.dart';
import 'package:stacked/stacked.dart';

class ExploreView extends StatefulWidget {
  @override
  _ExploreViewState createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExploreViewModel>.reactive(
        viewModelBuilder: () => ExploreViewModel(),
        onModelReady: (model) => model.init(this),
        builder: (buildContext, model, widget) {
          return MyScaffold(
            imageName: "explore_background.png",
            loading: model.isBusy,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: [
                Expanded(
                  child: NestedScrollView(
                    controller: model.scrollController,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) => [
                      SliverPersistentHeader(
                          pinned: false,
                          delegate: MySliverWidget(ExploreHeader(),
                              expandedHeight: 70)),
                      SliverPersistentHeader(
                          pinned: true,
                          delegate: MySliverWidget(
                              AnimatedBuilder(
                                animation: model.animationController,
                                builder: (context, child) {
                                  return Container(
                                    height: 64,
                                    color: Theme.of(buildContext)
                                        .bottomAppBarColor
                                        .withOpacity(model.alpha.value),
                                    child: Container(
                                      height: 32,
                                      margin:
                                          EdgeInsets.only(bottom: 10, top: 22),
                                      child: ListView.builder(
                                        itemCount: model.categories.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return CategoryItem(
                                            categoryObject:
                                                model.categories[index],
                                            index: index,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                              expandedHeight: 64))
                    ],
                    body: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 20),
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          BooksList(
                            title: "Books",
                            items: model.books,
                          ),
                          BooksList(
                            title: "Sets",
                            items: model.sets,
                          ),
                          BooksList(
                            title: "Influencers",
                            items: model.influencers,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class ExploreHeader extends ViewModelWidget<ExploreViewModel> {
  const ExploreHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ExploreViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      height: 50,
      child: Stack(
        children: [
          Offstage(
            offstage: viewModel.showSearch,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 36,
                      color: Theme.of(context).buttonColor),
                ),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Image.asset(
                      "assets/search_icon.png",
                      height: 22,
                      width: 22,
                      color: Theme.of(context).buttonColor.withOpacity(0.8),
                    ),
                    onPressed: viewModel.openSearch)
              ],
            ),
          ),
          Offstage(
            offstage: !viewModel.showSearch,
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                    showSearch: true,
                    lightBackground: Colors.white,
                    hintText: "Search",
                    border: false,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(28, 32, 38, 0.07),
                          blurRadius: 20,
                          offset: Offset(0, 4))
                    ],
                  ),
                ),
                SizedBox(
                  width: 11,
                ),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 14,
                          color:
                              Theme.of(context).buttonColor.withOpacity(0.7)),
                    ),
                    onPressed: viewModel.closeSearch)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BooksList extends ViewModelWidget<ExploreViewModel> {
  final String title;
  final List<BookObject> items;

  const BooksList({Key key, this.title = "Books", this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context, ExploreViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(top: 21),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: TextStyle(
                  color: Theme.of(context).buttonColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 13),
            height: 260,
            child: ListView.builder(
              itemCount: items.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return BookItem(
                  bookObject: items[index],
                  margin:
                      index == 0 ? EdgeInsets.only(left: 20, right: 25) : null,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class BookItem extends ViewModelWidget<ExploreViewModel> {
  final EdgeInsets margin;
  final BookObject bookObject;

  const BookItem({Key key, this.margin, @required this.bookObject})
      : super(key: key);

  @override
  Widget build(BuildContext context, ExploreViewModel viewModel) {
    return Container(
      alignment: Alignment.topCenter,
      margin: margin ?? EdgeInsets.only(right: 25),
      child: FlatButton(
        padding: EdgeInsets.zero,
        splashColor: MyColors.primary.withOpacity(0.1),
        highlightColor: MyColors.primary.withOpacity(0.1),
        hoverColor: MyColors.primary.withOpacity(0.1),
        onPressed: () => viewModel.onItemPressed(bookObject),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: bookObject.image + bookObject.title,
              child: Image.asset(
                "assets/${bookObject.image}",
                fit: BoxFit.cover,
                height: 200,
                width: 145,
              ),
            ),
            SizedBox(
              height: 7.5,
            ),
            Text(
              bookObject.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Theme.of(context).buttonColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  height: 1.4),
            ),
            SizedBox(
              height: 3.5,
            ),
            Text(bookObject.author,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Theme.of(context).buttonColor.withOpacity(0.6),
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    height: 1.9))
          ],
        ),
      ),
    );
  }
}
