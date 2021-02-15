import 'package:my_book_reloaded/core/models/base_json_object.dart';

class LegalObject with BaseJsonObject {
  LegalObject({
    this.title,
    this.list,
  });

  String title;
  List<String> list;

  factory LegalObject.fromJson(Map<String, dynamic> json) => LegalObject(
        title: json["title"],
        list: List<String>.from(json["list"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "list": List<dynamic>.from(list.map((x) => x)),
      };
}
