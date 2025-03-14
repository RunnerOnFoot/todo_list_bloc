import 'package:to_do_list_bloc/domain/entities/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_state.freezed.dart';
part 'task_state.g.dart';

@freezed
sealed class TaskState with _$TaskState {
  const factory TaskState({@Default([]) List<Task> tasks}) = _TaskState;

  factory TaskState.fromJson(Map<String, dynamic> json) =>
      _$TaskStateFromJson(json);
}
