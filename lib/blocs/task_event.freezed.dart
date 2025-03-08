// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskEvent()';
}


}

/// @nodoc
class $TaskEventCopyWith<$Res>  {
$TaskEventCopyWith(TaskEvent _, $Res Function(TaskEvent) __);
}


/// @nodoc


class TaskAdded implements TaskEvent {
  const TaskAdded(this.task);
  

 final  Task task;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskAddedCopyWith<TaskAdded> get copyWith => _$TaskAddedCopyWithImpl<TaskAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskAdded&&(identical(other.task, task) || other.task == task));
}


@override
int get hashCode => Object.hash(runtimeType,task);

@override
String toString() {
  return 'TaskEvent.added(task: $task)';
}


}

/// @nodoc
abstract mixin class $TaskAddedCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory $TaskAddedCopyWith(TaskAdded value, $Res Function(TaskAdded) _then) = _$TaskAddedCopyWithImpl;
@useResult
$Res call({
 Task task
});


$TaskCopyWith<$Res> get task;

}
/// @nodoc
class _$TaskAddedCopyWithImpl<$Res>
    implements $TaskAddedCopyWith<$Res> {
  _$TaskAddedCopyWithImpl(this._self, this._then);

  final TaskAdded _self;
  final $Res Function(TaskAdded) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? task = null,}) {
  return _then(TaskAdded(
null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as Task,
  ));
}

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskCopyWith<$Res> get task {
  
  return $TaskCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}

/// @nodoc


class TaskRemoved implements TaskEvent {
  const TaskRemoved(this.index);
  

 final  int index;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskRemovedCopyWith<TaskRemoved> get copyWith => _$TaskRemovedCopyWithImpl<TaskRemoved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskRemoved&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'TaskEvent.removed(index: $index)';
}


}

/// @nodoc
abstract mixin class $TaskRemovedCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory $TaskRemovedCopyWith(TaskRemoved value, $Res Function(TaskRemoved) _then) = _$TaskRemovedCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class _$TaskRemovedCopyWithImpl<$Res>
    implements $TaskRemovedCopyWith<$Res> {
  _$TaskRemovedCopyWithImpl(this._self, this._then);

  final TaskRemoved _self;
  final $Res Function(TaskRemoved) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(TaskRemoved(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class TaskUpdated implements TaskEvent {
  const TaskUpdated(this.index, this.newTask);
  

 final  int index;
 final  Task newTask;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskUpdatedCopyWith<TaskUpdated> get copyWith => _$TaskUpdatedCopyWithImpl<TaskUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskUpdated&&(identical(other.index, index) || other.index == index)&&(identical(other.newTask, newTask) || other.newTask == newTask));
}


@override
int get hashCode => Object.hash(runtimeType,index,newTask);

@override
String toString() {
  return 'TaskEvent.updated(index: $index, newTask: $newTask)';
}


}

/// @nodoc
abstract mixin class $TaskUpdatedCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory $TaskUpdatedCopyWith(TaskUpdated value, $Res Function(TaskUpdated) _then) = _$TaskUpdatedCopyWithImpl;
@useResult
$Res call({
 int index, Task newTask
});


$TaskCopyWith<$Res> get newTask;

}
/// @nodoc
class _$TaskUpdatedCopyWithImpl<$Res>
    implements $TaskUpdatedCopyWith<$Res> {
  _$TaskUpdatedCopyWithImpl(this._self, this._then);

  final TaskUpdated _self;
  final $Res Function(TaskUpdated) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,Object? newTask = null,}) {
  return _then(TaskUpdated(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,null == newTask ? _self.newTask : newTask // ignore: cast_nullable_to_non_nullable
as Task,
  ));
}

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskCopyWith<$Res> get newTask {
  
  return $TaskCopyWith<$Res>(_self.newTask, (value) {
    return _then(_self.copyWith(newTask: value));
  });
}
}

// dart format on
