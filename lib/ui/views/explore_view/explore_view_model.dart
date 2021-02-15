import 'package:flutter/cupertino.dart';
import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/app/router.gr.dart';
import 'package:my_book_reloaded/core/models/book_object.dart';
import 'package:my_book_reloaded/core/models/category_object.dart';
import 'package:my_book_reloaded/core/services/books/books_service.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:stacked/stacked.dart';

class ExploreViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bookService = locator<BooksService>();

  int categoryIndex = 0;
  bool showSearch = false;
  ScrollController scrollController = ScrollController();
  AnimationController animationController;
  Tween<double> tween = Tween<double>(begin: 0.0, end: 1.0);
  Animation<double> alpha;

  List<CategoryObject> categories = [
    CategoryObject("Mind"),
    CategoryObject("Emotions"),
    CategoryObject("Body"),
    CategoryObject("Work"),
  ];

  List<BookObject> books = [];

  List<BookObject> sets = [];

  List<BookObject> influencers = [];

  void init(_exploreViewState) {
    animationController = AnimationController(vsync: _exploreViewState);
    alpha = tween.animate(animationController);

    scrollController.addListener(() {
      if (scrollController.offset >= 60 && scrollController.offset <= 140) {
        double headerOpacity =
            ((scrollController.offset - 65) / 65).clamp(0.0, 1.0);
        animationController.value = headerOpacity;
      } else if (scrollController.offset < 60 &&
          animationController.value != 0) {
        animationController.value = 0;
      }
    });
    getBooksList();
  }

  Future<void> getBooksList() async {
    setBusy(true);
    List<BookObject> list = await _bookService.getBooksList();
    books = list.where((element) => element.type == BookType.book).toList();
    sets = list.where((element) => element.type == BookType.set).toList();
    influencers =
        list.where((element) => element.type == BookType.influencer).toList();
    setBusy(false);
  }

  void openSearch() {
    showSearch = true;
    notifyListeners();
  }

  void onItemPressed(BookObject bookObject) {
    _openBaseBookView(bookObject);
  }

  void _openBaseBookView(BookObject bookObject) {
    _navigationService.pushNamed(Routes.BaseBookView,
        arguments: BaseBookViewArguments(bookObject: bookObject));
  }

  void closeSearch() {
    showSearch = false;
    notifyListeners();
  }

  void changeCategory(int index) {
    categoryIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    animationController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
