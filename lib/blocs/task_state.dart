import 'package:to_do_list_bloc/models/task.dart';
import 'package:equatable/equatable.dart';

class TaskState extends Equatable {
  final List<Task> tasks;

  const TaskState({this.tasks = const []});

  @override
  List<Object?> get props => [tasks];

  Map<String, dynamic> toJson() {
    return {'tasks': tasks.map((task) => task.toJson()).toList()};
  }

  factory TaskState.fromJson(Map<String, dynamic> json) {
    return TaskState(
      tasks:
          (json['tasks'] as List).map((task) => Task.fromJson(task)).toList(),
    );
  }
}
