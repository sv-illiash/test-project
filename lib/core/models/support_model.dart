import 'package:my_book_reloaded/core/models/base_json_object.dart';

class SupportModel with BaseJsonObject {
  SupportModel({
    this.list,
  });

  List<SupportItemModel> list;

  factory SupportModel.fromJson(Map<String, dynamic> json) => SupportModel(
        list: List<SupportItemModel>.from(
            json["list"].map((x) => SupportItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class SupportItemModel {
  SupportItemModel({
    this.title,
    this.description,
  });

  String title;
  String description;

  factory SupportItemModel.fromJson(Map<String, dynamic> json) =>
      SupportItemModel(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}
