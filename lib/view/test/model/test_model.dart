import 'package:flutter_architecture/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'test_model.g.dart';

@JsonSerializable()
class TestModel extends BaseModel {
  //Base model extend et
  int? userId;
  int? id;
  String? title;
  String? body;

  TestModel({this.userId, this.id, this.title, this.body});

  Map<String, Object?> toJson() {
    return _$TestModelToJson(this);
  }

  @override
  fromJson(Map<String, Object> json) {
    return _$TestModelFromJson(json);
  }
}
