import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:to_do_list_bloc/models/task.dart';

part 'task_event.freezed.dart';

@freezed
sealed class TaskEvent with _$TaskEvent {
  const factory TaskEvent.added(Task task) = TaskAdded;

  const factory TaskEvent.removed(int index) = TaskRemoved;

  const factory TaskEvent.updated(int index, Task newTask) = TaskUpdated;
}
