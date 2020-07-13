class Task {
  final String taskText;
  bool isDone;

  Task({this.taskText, this.isDone});

  void toggleDone() {
    isDone = !isDone;
  }
}
