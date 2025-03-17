import 'package:to_do_list_bloc/domain/entities/task.dart';

abstract class TaskRepository {
  Future<Task> addTask(Task task);
  Future<void> removeTask(int id);
  Future<void> updateTask(int id, Task newTask);
  Future<List<Task>> getTasks();
}
