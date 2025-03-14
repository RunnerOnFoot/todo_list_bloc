import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
sealed class Task with _$Task {
  const factory Task({required String name, @Default(false) bool isDone}) =
      _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
