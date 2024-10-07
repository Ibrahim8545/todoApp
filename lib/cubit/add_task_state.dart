abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskDateSelected extends TaskState {
  final DateTime date;
  TaskDateSelected(this.date);
}

class TaskAdded extends TaskState {}