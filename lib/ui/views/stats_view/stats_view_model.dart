import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/app/router.gr.dart';
import 'package:my_book_reloaded/core/models/book_object.dart';
import 'package:my_book_reloaded/core/services/books/books_service.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:stacked/stacked.dart';

class StatsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _booksService = locator<BooksService>();

  List<BookObject> _statsList = [];

  List<BookObject> get statsList => _statsList;

  void init() {
    _getStatsList();
  }

  Future<void> _getStatsList() async {
    setBusy(true);
    _statsList = await _booksService.getStatsList();
    setBusy(false);
  }

  void openStatsDetailsView(BookObject statObject) {
    _navigationService.pushNamed(Routes.StatsDetailsView,
        arguments: StatsDetailsViewArguments(statObject: statObject));
  }
}
