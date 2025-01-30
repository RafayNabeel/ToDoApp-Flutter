import 'package:flutter/material.dart';
import 'package:todo_app/tasks.dart';

class Taskpage extends StatefulWidget {
  final Function(int) onTaskCompletion; // Callback from Home
  final Tasks task;

  const Taskpage({
    super.key,
    required this.onTaskCompletion,
    required this.task,
  });

  @override
  State<Taskpage> createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  var textController = TextEditingController();
  // String taskString = "";

  @override
  Widget build(BuildContext context) {
    textController.text =
        widget.task.taskDescription; // initial task description
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Task No : ${widget.task.taskNo}',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                // save logic
                widget.task.taskDescription = textController.text;
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.done,
                size: 30,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: textController,
            decoration: InputDecoration(
              hintText: '  Enter task',
            ),
            maxLines: null, // Allows text input to wrap to the next line
          ),
        ],
      ),
      bottomNavigationBar: ElevatedButton(
        style: ButtonStyle(
          fixedSize: WidgetStateProperty.all(Size(300, 80)),
          backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
        ),
        onPressed: () {
          // Mark task as completed and go back
          widget.task.isCompleted = true;

          Navigator.pop(context);
        },
        child: Text(
          "Mark as completed",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
