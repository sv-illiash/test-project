import 'package:flutter/material.dart';
import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/app/router.gr.dart';
import 'package:my_book_reloaded/core/models/book_object.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:stacked/stacked.dart';

class StatsDetailsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  BookObject _statObject;

  BookObject get statObject => _statObject;

  TabController tabController;
  ScrollController scrollController = ScrollController();
  AnimationController animationController;
  Tween<double> tween = Tween<double>(begin: 0.0, end: 1.0);
  Animation<double> alpha;

  init(_bookViewState, BookObject statObject) {
    _statObject = statObject;
    animationController = AnimationController(vsync: _bookViewState);
    alpha = tween.animate(animationController);
    tabController = TabController(length: 3, vsync: _bookViewState);

    scrollController.addListener(() {
      if (scrollController.offset >= 160 && scrollController.offset <= 195) {
        double headerOpacity =
            ((scrollController.offset - 160) / 35).clamp(0.0, 1.0);
        animationController.value = headerOpacity;
      } else if (scrollController.offset < 160 &&
          animationController.value != 0) {
        animationController.value = 0;
      } else if (scrollController.offset > 195 &&
          animationController.value != 1) {
        animationController.value = 1;
      }
    });
  }

  void openChapterMessagesView(ChapterObject chapterObject) {
    _navigationService.pushNamed(Routes.ChapterView,
        arguments: ChapterViewArguments(chapterObject: chapterObject));
  }

  void onBackPressed() {
    _navigationService.pop();
  }

  @override
  void dispose() {
    tabController.dispose();
    scrollController.dispose();
    animationController.dispose();
    super.dispose();
  }
}
