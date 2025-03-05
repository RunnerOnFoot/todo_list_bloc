import 'package:to_do_list_bloc/models/task.dart';
import 'package:equatable/equatable.dart';

class TaskState extends Equatable {
  final List<Task> tasks;

  const TaskState({this.tasks = const []});

  @override
  List<Object?> get props => [tasks];
}
