import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_bloc/domain/usecases/add_task.dart';
import 'package:to_do_list_bloc/domain/usecases/remove_task.dart';
import 'package:to_do_list_bloc/domain/usecases/update_task.dart';
import '../../domain/entities/task.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final AddTask addTask;
  final RemoveTask removeTask;
  final UpdateTask updateTask;

  TaskBloc({
    required this.addTask,
    required this.removeTask,
    required this.updateTask,
  }) : super(const TaskState()) {
    on<TaskEvent>((event, emit) async {
      switch (event) {
        case TaskEvent$TaskAdded(:final task):
          await addTask(task);
          emit(state.copyWith(tasks: List.from(state.tasks)..add(task)));
          break;

        case TaskEvent$TaskRemoved(:final index):
          await removeTask(index);
          final updatedTasks = List<Task>.from(state.tasks)..removeAt(index);
          emit(state.copyWith(tasks: updatedTasks));
          break;

        case TaskEvent$TaskUpdated(:final index, :final newTask):
          await updateTask(index, newTask);
          final updatedTasks = List<Task>.from(state.tasks);
          if (index >= 0 && index < updatedTasks.length) {
            updatedTasks[index] = newTask;
          }
          emit(state.copyWith(tasks: updatedTasks));
          break;
      }
    });
  }
}
