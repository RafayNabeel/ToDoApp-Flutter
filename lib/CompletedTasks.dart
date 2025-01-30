import 'package:flutter/material.dart';
import 'package:todo_app/tasks.dart';

class Completedtasks extends StatefulWidget {
  // need the number of the tasksCompleted
  // need the string/description of the completedTask

  final int taskIndex;

  final List<Tasks> taskLists_Completed;

  const Completedtasks({
    super.key,
    required this.taskIndex,
    required this.taskLists_Completed,
  });

  @override
  State<Completedtasks> createState() => _CompletedtasksState();
}

class _CompletedtasksState extends State<Completedtasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Completed Tasks",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        
      ),
      backgroundColor: Colors.black,
      // body: widget.taskLists_Completed.isEmpty
      //     ?
      // return,
      body: ListView.builder(
        itemCount: widget.taskLists_Completed.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              height: 65,
              width: double.infinity,
              child: Center(
                  child: Text(
                'Task No : ${widget.taskLists_Completed[index].taskNo}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )),
            ),
          );
        },
      ),
    );
  }
}
