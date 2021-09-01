// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestModel _$TestModelFromJson(Map<String, dynamic> json) {
  return TestModel(
    userId: json['userId'] as int?,
    id: json['id'] as int?,
    title: json['title'] as String?,
    body: json['body'] as String?,
  );
}

Map<String, dynamic> _$TestModelToJson(TestModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
