import 'package:to_do_list_bloc/domain/entities/task.dart';

abstract class TaskRepository {
  Future<void> addTask(Task task);
  Future<void> removeTask(int index);
  Future<void> updateTask(int index, Task newTask);
  Future<List<Task>> getTasks();
}
