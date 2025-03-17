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


class TaskEvent$TaskAdded implements TaskEvent {
  const TaskEvent$TaskAdded(this.task);
  

 final  Task task;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskEvent$TaskAddedCopyWith<TaskEvent$TaskAdded> get copyWith => _$TaskEvent$TaskAddedCopyWithImpl<TaskEvent$TaskAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskEvent$TaskAdded&&(identical(other.task, task) || other.task == task));
}


@override
int get hashCode => Object.hash(runtimeType,task);

@override
String toString() {
  return 'TaskEvent.added(task: $task)';
}


}

/// @nodoc
abstract mixin class $TaskEvent$TaskAddedCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory $TaskEvent$TaskAddedCopyWith(TaskEvent$TaskAdded value, $Res Function(TaskEvent$TaskAdded) _then) = _$TaskEvent$TaskAddedCopyWithImpl;
@useResult
$Res call({
 Task task
});


$TaskCopyWith<$Res> get task;

}
/// @nodoc
class _$TaskEvent$TaskAddedCopyWithImpl<$Res>
    implements $TaskEvent$TaskAddedCopyWith<$Res> {
  _$TaskEvent$TaskAddedCopyWithImpl(this._self, this._then);

  final TaskEvent$TaskAdded _self;
  final $Res Function(TaskEvent$TaskAdded) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? task = null,}) {
  return _then(TaskEvent$TaskAdded(
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


class TaskEvent$TaskRemoved implements TaskEvent {
  const TaskEvent$TaskRemoved(this.index);
  

 final  int index;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskEvent$TaskRemovedCopyWith<TaskEvent$TaskRemoved> get copyWith => _$TaskEvent$TaskRemovedCopyWithImpl<TaskEvent$TaskRemoved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskEvent$TaskRemoved&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'TaskEvent.removed(index: $index)';
}


}

/// @nodoc
abstract mixin class $TaskEvent$TaskRemovedCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory $TaskEvent$TaskRemovedCopyWith(TaskEvent$TaskRemoved value, $Res Function(TaskEvent$TaskRemoved) _then) = _$TaskEvent$TaskRemovedCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class _$TaskEvent$TaskRemovedCopyWithImpl<$Res>
    implements $TaskEvent$TaskRemovedCopyWith<$Res> {
  _$TaskEvent$TaskRemovedCopyWithImpl(this._self, this._then);

  final TaskEvent$TaskRemoved _self;
  final $Res Function(TaskEvent$TaskRemoved) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(TaskEvent$TaskRemoved(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class TaskEvent$TaskUpdated implements TaskEvent {
  const TaskEvent$TaskUpdated(this.index, this.newTask);
  

 final  int index;
 final  Task newTask;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskEvent$TaskUpdatedCopyWith<TaskEvent$TaskUpdated> get copyWith => _$TaskEvent$TaskUpdatedCopyWithImpl<TaskEvent$TaskUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskEvent$TaskUpdated&&(identical(other.index, index) || other.index == index)&&(identical(other.newTask, newTask) || other.newTask == newTask));
}


@override
int get hashCode => Object.hash(runtimeType,index,newTask);

@override
String toString() {
  return 'TaskEvent.updated(index: $index, newTask: $newTask)';
}


}

/// @nodoc
abstract mixin class $TaskEvent$TaskUpdatedCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory $TaskEvent$TaskUpdatedCopyWith(TaskEvent$TaskUpdated value, $Res Function(TaskEvent$TaskUpdated) _then) = _$TaskEvent$TaskUpdatedCopyWithImpl;
@useResult
$Res call({
 int index, Task newTask
});


$TaskCopyWith<$Res> get newTask;

}
/// @nodoc
class _$TaskEvent$TaskUpdatedCopyWithImpl<$Res>
    implements $TaskEvent$TaskUpdatedCopyWith<$Res> {
  _$TaskEvent$TaskUpdatedCopyWithImpl(this._self, this._then);

  final TaskEvent$TaskUpdated _self;
  final $Res Function(TaskEvent$TaskUpdated) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,Object? newTask = null,}) {
  return _then(TaskEvent$TaskUpdated(
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

/// @nodoc


class TaskEvent$LoadTasks implements TaskEvent {
  const TaskEvent$LoadTasks();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskEvent$LoadTasks);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskEvent.loadTasks()';
}


}




// dart format on
