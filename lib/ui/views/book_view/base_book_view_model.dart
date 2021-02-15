import 'package:flutter/material.dart';
import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/app/router.gr.dart';
import 'package:my_book_reloaded/core/models/book_object.dart';
import 'package:my_book_reloaded/core/models/package_object.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:my_book_reloaded/ui/widgets/package_widget.dart';
import 'package:stacked/stacked.dart';

class BaseBookViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  BookObject _bookObject;

  TabController tabController;
  ScrollController scrollController = ScrollController();
  AnimationController animationController;
  Tween<double> tween = Tween<double>(begin: 0.0, end: 1.0);
  Animation<double> alpha;

  List<int> selectedHabits = [];

  BookObject get bookObject => _bookObject;

  bool get isSelectHabitsVisible => tabController.index == 0;

  List<PackageObject> packages = [
    PackageObject("light", 5),
    PackageObject("Moderate", 15),
    PackageObject("Deep", 20),
  ];

  int selectedIndex = 1;

  init(_bookViewState, BookObject bookObject) {
    _bookObject = bookObject;
    animationController = AnimationController(vsync: _bookViewState);

    alpha = tween.animate(animationController);

    tabController = TabController(length: 2, vsync: _bookViewState);

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

  List<Widget> buildPackages() {
    List<Widget> list = [];
    for (int i = 0; i < packages.length; i++) {
      list.add(PackageWidget(
        onSelected: onPackageSelected,
        index: i,
        packageObject: packages[i],
        currentIndex: selectedIndex,
      ));
    }
    return list;
  }

  String getAboutName() {
    switch (_bookObject.type) {
      case BookType.book:
        return "About book";
        break;
      case BookType.influencer:
        return "About Influencer";
        break;
      case BookType.set:
        return "About Set";
        break;
      default:
        return "About book";
        break;
    }
  }

  void onHabitPressed(int index) {
    if (selectedHabits.contains(index)) {
      selectedHabits.remove(index);
    } else {
      selectedHabits.add(index);
    }
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
