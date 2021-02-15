import 'package:my_book_reloaded/core/models/legal_object.dart';
import 'package:my_book_reloaded/core/models/support_model.dart';

abstract class BaseJsonObject {
  factory BaseJsonObject.fromJson(Map<String, dynamic> json, String type) {
    switch (type) {
      case 'SupportModel':
        return SupportModel.fromJson(json);
      case 'LegalObject':
        return LegalObject.fromJson(json);
      default:
        return SupportModel.fromJson(json);
    }
  }
}
