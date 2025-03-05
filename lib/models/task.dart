class Task {
  final String name;
  final bool isDone;

  Task({required this.name, this.isDone = false});

  Task copyWith({String? name, bool? isDone}) {
    return Task(name: name ?? this.name, isDone: isDone ?? this.isDone);
  }

  Task toggleDone() {
    return copyWith(isDone: !isDone);
  }
}
