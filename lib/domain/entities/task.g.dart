// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  isDone: json['isDone'] as bool? ?? false,
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'isDone': instance.isDone,
};
