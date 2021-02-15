import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/core/models/book_object.dart';
import 'package:my_book_reloaded/core/services/bottom_sheet/bottom_sheet_service.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:my_book_reloaded/ui/widgets/filter_bottom_sheet/filter_bottom_sheet.dart';
import 'package:stacked/stacked.dart';

class ChapterViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  double value = 5;
  ChapterObject _chapterObject;

  ChapterObject get chapterObject => _chapterObject;

  bool isMessagesType() {
    switch (_chapterObject.type) {
      case ChapterType.messages:
        return true;
        break;
      case ChapterType.value:
        return false;
        break;
    }
    return true;
  }

  void init(ChapterObject chapterObject) {
    _chapterObject = chapterObject;
  }

  void onChange(double value) {
    this.value = value;
    notifyListeners();
  }

  void openFilter() {
    _bottomSheetService.openBottomSheet(FilterBottomSheet(
      onApplyCallback: () {
        print("test");
      },
    ));
  }

  void onBackPressed() {
    _navigationService.pop();
  }
}
