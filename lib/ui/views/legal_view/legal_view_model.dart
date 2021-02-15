import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/core/models/legal_object.dart';
import 'package:my_book_reloaded/core/services/json/json_service.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:stacked/stacked.dart';

class LegalViewModel extends BaseViewModel {
  final _jsonService = locator<JsonService>();
  final _navigationService = locator<NavigationService>();

  final String data;

  LegalObject legalObject;

  LegalViewModel(this.data) {
    setBusy(true);
  }

  onBackPressed() {
    _navigationService.pop();
  }

  void getData() async {
    setBusy(true);
    legalObject = await _jsonService.readJson<LegalObject>(data);
    legalObject.list.insert(0, legalObject.title);
    setBusy(false);
  }
}
