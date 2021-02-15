import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/core/models/book_object.dart';
import 'package:my_book_reloaded/core/services/books/books_service.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:stacked/stacked.dart';

class NotificationsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bookService = locator<BooksService>();

  List<BookObject> list;

  getBooksList() async {
    setBusy(true);
    list = await _bookService.getBooksList();
    list.forEach((element) {
      element.notification = false;
    });
    setBusy(false);
  }

  onSwitcherChange(bool value, int index) {
    list[index].notification = value;
    notifyListeners();
  }

  onBackPressed() {
    _navigationService.pop();
  }
}
