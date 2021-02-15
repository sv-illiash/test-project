import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:stacked/stacked.dart';

class SuccessViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  String title;
  String nextRoute;

  void init(String nextRoute, String title) {
    this.title = title;
    this.nextRoute = nextRoute;
  }

  onOkPressed() {
    if (nextRoute != null) {
      _navigationService.pushNamedAndRemoveUntil(nextRoute,
          predicate: (route) => false);
    } else {
      _navigationService.pop();
    }
  }
}
