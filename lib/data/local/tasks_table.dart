import 'package:drift/drift.dart';

class Tasks extends Table {
  // An auto-incremented primary key.
  IntColumn get id => integer().autoIncrement()();

  // Task name
  TextColumn get name => text()();

  // Completion flag with a default value of false.
  BoolColumn get isDone => boolean().withDefault(const Constant(false))();
}
