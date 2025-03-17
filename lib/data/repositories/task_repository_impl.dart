import 'package:injectable/injectable.dart';
import 'package:to_do_list_bloc/domain/entities/task.dart' as domain;
import 'package:to_do_list_bloc/domain/repositories/task_repository.dart';
import 'package:to_do_list_bloc/data/local/drift_database.dart';
import 'package:drift/drift.dart';

@LazySingleton(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final AppDatabase database;

  TaskRepositoryImpl(this.database);

  @override
  Future<domain.Task> addTask(domain.Task task) async {
    final taskCompanion = TasksCompanion.insert(
      name: task.name,
      isDone: Value(task.isDone),
    );
    // The insertTask method returns the auto-generated id.
    final id = await database.insertTask(taskCompanion);
    // Return a copy of the task with the new id.
    return task.copyWith(id: id);
  }

  @override
  Future<void> removeTask(int id) async {
    await database.deleteTask(id);
  }

  @override
  Future<void> updateTask(int id, domain.Task newTask) async {
    // Create a Drift Task instance from newTask.
    // Note: 'Task' here refers to the Drift-generated class (from drift_database.g.dart).
    final driftTask = Task(id: id, name: newTask.name, isDone: newTask.isDone);
    await database.updateTask(driftTask);
  }

  @override
  Future<List<domain.Task>> getTasks() async {
    final driftTasks = await database.getAllTasks();
    // Map each Drift Task to a domain.Task.
    return driftTasks
        .map((t) => domain.Task(id: t.id, name: t.name, isDone: t.isDone))
        .toList();
  }
}
