// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskState _$TaskStateFromJson(Map<String, dynamic> json) => _TaskState(
  tasks:
      (json['tasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$TaskStateToJson(_TaskState instance) =>
    <String, dynamic>{'tasks': instance.tasks};
