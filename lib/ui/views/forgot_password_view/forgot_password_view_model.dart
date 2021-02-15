import 'package:cupertino_stackview/misc.dart';
import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/app/router.gr.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  onBackPressed() {
    cupertinoStackViewController.back();
  }

  openSuccessView() {
    _navigationService.pushNamedAndRemoveUntil(Routes.SuccessView,
        arguments: SuccessViewArguments(
            nextRoute: Routes.JoinUsView,
            title: "We`ll send you a link to reset you password on your mail"),
        predicate: (route) => false);
  }
}
