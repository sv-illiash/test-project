import 'package:flutter/material.dart';
import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/app/router.gr.dart';
import 'package:my_book_reloaded/core/models/book_object.dart';
import 'package:my_book_reloaded/core/services/books/books_service.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bookService = locator<BooksService>();

  TabController tabController;
  ScrollController scrollController = ScrollController();
  AnimationController animationController;
  AnimationController marginController;
  Tween<double> tween = Tween<double>(begin: 0.0, end: 1.0);
  Animation<double> alpha;
  Animation<double> margin;

  bool isEdit = false;

  List<BookObject> items = [];
  List<List<BookObject>> pageItems = [];

  int selectedIndex = 0;

  init(_bookViewState) {
    animationController = AnimationController(vsync: _bookViewState);
    marginController = AnimationController(vsync: _bookViewState);

    alpha = tween.animate(animationController);
    margin = tween.animate(marginController);

    tabController = TabController(length: 4, vsync: _bookViewState);

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
    getHomeBookList();
  }

  Future<void> getHomeBookList() async {
    setBusy(true);
    items = await _bookService.getBooksList();
    items.first.selected = true;
    pageItems = [];
    for (var i = 0; i < items.length; i += 3) {
      pageItems
          .add(items.sublist(i, i + 3 > items.length ? items.length : i + 3));
    }
    setBusy(false);
  }

  void onEditSwitch() {
    isEdit = !isEdit;
    notifyListeners();
  }

  void openChapter() {
    _navigationService.pushNamed(Routes.AudioIntroView);
  }

  void onSelect(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void onRemainderView() {
    _navigationService.pushNamed(Routes.ReminderView);
  }

  void onPackageSelected(int index) {
    selectedIndex = index;
    notifyListeners();
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
