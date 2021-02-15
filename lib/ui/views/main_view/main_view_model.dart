import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/views/account_view/account_view.dart';
import 'package:my_book_reloaded/ui/views/explore_view/explore_view.dart';
import 'package:my_book_reloaded/ui/views/home_view/home_view.dart';
import 'package:my_book_reloaded/ui/views/stats_view/stats_view.dart';
import 'package:stacked/stacked.dart';

class MainViewModel extends BaseViewModel {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void onSelectTab(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Widget screen() {
    switch (_currentIndex) {
      case 0:
        return HomeView();
        break;
      case 1:
        return ExploreView();
        break;
      case 2:
        return StatsView();
        break;
      case 3:
        return AccountView();
        break;
      default:
        return Container();
        break;
    }
  }
}
