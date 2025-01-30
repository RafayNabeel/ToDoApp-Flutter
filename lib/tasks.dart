class Tasks {
  final int taskNo;
  late String taskDescription;
  bool isCompleted;

  Tasks(
      {required this.taskNo,
      required this.taskDescription,
      this.isCompleted = false});

  void taskCompleted() {
    isCompleted = !isCompleted;
    // isCompleted is changed to true;
    // should be integrated in the mark as completed button?
  }

  bool emptyList() {
    if (taskDescription.isEmpty || taskNo <= 0) {
      return true;
    } else
      return false;
  }
  // 
}
