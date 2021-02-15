import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:stacked/stacked.dart';

class FeedbackDialogModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void onApply() {
    _navigationService.pop();
  }

  void onCancel() {
    _navigationService.pop();
  }
}
