import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:stacked/stacked.dart';

class FilterBottomSheetModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  Function _onApplyCallback;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void init(Function onApplyCallback) {
    _onApplyCallback = onApplyCallback;
  }

  void onSelected(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void onApply() {
    _onApplyCallback.call();
    _navigationService.pop();
  }

  void onCancel() {
    _navigationService.pop();
  }
}
