import 'package:equatable/equatable.dart';
import 'package:to_do_list_bloc/models/task.dart';

abstract class TaskEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddTask extends TaskEvent {
  final Task task;

  AddTask(this.task);

  @override
  List<Object?> get props => [task];
}

class ToggleTask extends TaskEvent {
  final int index;

  ToggleTask(this.index);

  @override
  List<Object?> get props => [index];
}

class DeleteTask extends TaskEvent {
  final int index;

  DeleteTask(this.index);

  @override
  List<Object?> get props => [index];
}
