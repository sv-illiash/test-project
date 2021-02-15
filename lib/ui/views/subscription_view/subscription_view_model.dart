import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:stacked/stacked.dart';

class SubscriptionViewModel extends BaseViewModel {


  final _navigationService = locator<NavigationService>();
  int selectedIndex = 0;

  void onSelect(int index) {
    selectedIndex = index;
    notifyListeners();
  }
  onBackPressed() {
    _navigationService.pop();
  }

}
