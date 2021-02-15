import 'package:my_book_reloaded/core/models/base_json_object.dart';

abstract class JsonService {
  Future<BaseJsonObject> readJson<T>(String name);
}
