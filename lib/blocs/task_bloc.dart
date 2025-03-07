import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../models/task.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>((event, emit) {
      final newTasks = List<Task>.from(state.tasks)..add(event.task);
      emit(TaskState(tasks: newTasks));
    });

    on<ToggleTask>((event, emit) {
      final updatedTasks = List<Task>.from(state.tasks);
      updatedTasks[event.index].toggleDone();
      emit(TaskState(tasks: updatedTasks));
    });

    on<DeleteTask>((event, emit) {
      final updatedTasks = List<Task>.from(state.tasks)..removeAt(event.index);
      emit(TaskState(tasks: updatedTasks));
    });
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    final tasks =
        (json['tasks'] as List)
            .map((task) => Task(name: task['name'], isDone: task['isDone']))
            .toList();
    return TaskState(tasks: tasks);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return {
      'tasks':
          state.tasks
              .map((task) => {'name': task.name, 'isDone': task.isDone})
              .toList(),
    };
  }
}
