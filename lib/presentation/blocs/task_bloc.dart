import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_bloc/domain/usecases/add_task.dart';
import 'package:to_do_list_bloc/domain/usecases/remove_task.dart';
import 'package:to_do_list_bloc/domain/usecases/update_task.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import 'task_event.dart';
import 'task_state.dart';

@injectable
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final AddTask addTask;
  final RemoveTask removeTask;
  final UpdateTask updateTask;
  final TaskRepository taskRepository;

  TaskBloc({
    required this.addTask,
    required this.removeTask,
    required this.updateTask,
    required this.taskRepository,
  }) : super(const TaskState()) {
    // Register event handlers
    on<TaskEvent$LoadTasks>(_onLoadTasks);
    on<TaskEvent$TaskAdded>(_onTaskAdded);
    on<TaskEvent$TaskRemoved>(_onTaskRemoved);
    on<TaskEvent$TaskUpdated>(_onTaskUpdated);

    // Load tasks on startup.
    add(const TaskEvent.loadTasks());
  }

  Future<void> _onLoadTasks(
    TaskEvent$LoadTasks event,
    Emitter<TaskState> emit,
  ) async {
    final tasks = await taskRepository.getTasks();
    emit(state.copyWith(tasks: tasks));
  }

  Future<void> _onTaskAdded(
    TaskEvent$TaskAdded event,
    Emitter<TaskState> emit,
  ) async {
    // Use the use case to add the task and get a new task with an id.
    final newTask = await addTask(event.task);
    final updatedTasks = List<Task>.from(state.tasks)..add(newTask);
    emit(state.copyWith(tasks: updatedTasks));
  }

  Future<void> _onTaskRemoved(
    TaskEvent$TaskRemoved event,
    Emitter<TaskState> emit,
  ) async {
    // Look up the task id from the state using the provided index.
    if (event.index < 0 || event.index >= state.tasks.length) return;
    final taskId = state.tasks[event.index].id;
    if (taskId == null) return;
    await removeTask(taskId);
    final updatedTasks = List<Task>.from(state.tasks)..removeAt(event.index);
    emit(state.copyWith(tasks: updatedTasks));
  }

  Future<void> _onTaskUpdated(
    TaskEvent$TaskUpdated event,
    Emitter<TaskState> emit,
  ) async {
    if (event.index < 0 || event.index >= state.tasks.length) return;
    final taskId = state.tasks[event.index].id;
    if (taskId == null) return;
    await updateTask(taskId, event.newTask);
    final updatedTasks = List<Task>.from(state.tasks);
    // Ensure the updated task keeps its id.
    updatedTasks[event.index] = event.newTask.copyWith(id: taskId);
    emit(state.copyWith(tasks: updatedTasks));
  }
}
