import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:my_book_reloaded/core/models/base_json_object.dart';
import 'package:my_book_reloaded/core/services/json/json_service.dart';

@LazySingleton(as: JsonService)
class JsonServiceImpl extends JsonService {
  @override
  Future<BaseJsonObject> readJson<T>(String name) async {
    String data = await rootBundle.loadString('assets/json/$name');
    return BaseJsonObject.fromJson(json.decode(data), T.toString());
  }
}
