import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:to_do_list_bloc/domain/entities/task.dart';

part 'task_event.freezed.dart';

@freezed
sealed class TaskEvent with _$TaskEvent {
  const factory TaskEvent.added(Task task) = TaskEvent$TaskAdded;
  const factory TaskEvent.removed(int index) = TaskEvent$TaskRemoved;
  const factory TaskEvent.updated(int index, Task newTask) =
      TaskEvent$TaskUpdated;
}
