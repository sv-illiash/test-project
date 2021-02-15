import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/core/models/support_model.dart';
import 'package:my_book_reloaded/core/services/json/json_service.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:stacked/stacked.dart';

class SupportViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _jsonService = locator<JsonService>();

  Future<SupportModel> getSupportList() async {
    return await _jsonService.readJson<SupportModel>("support.json");
  }

  onBackPressed() {
    _navigationService.pop();
  }
}
