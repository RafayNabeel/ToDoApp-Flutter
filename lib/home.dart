import 'package:flutter/material.dart';
import 'dart:async';
import 'package:todo_app/CompletedTasks.dart';
import 'package:todo_app/TaskPage.dart';
import 'package:todo_app/tasks.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Tasks> taskLists = [];
  int counter = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  // Function to add new tasks
  void addTasks() {
    setState(() {
      counter++;
      taskLists.add(Tasks(
        taskNo: counter,
        taskDescription: "Task no : $counter",
      ));
    });
  }

  // completedList

  List<Tasks> completedList() {
    List<Tasks> completedTasksLists = [];

    for (int i = 0; i < taskLists.length; i++) {
      if (taskLists[i].isCompleted == true) {
        completedTasksLists.add(taskLists[i]);
      }
    }
    return completedTasksLists;
  }

  // Function to delete a task
  void taskDeletion(int index) {
    setState(() {
      taskLists[index].taskCompleted();
      if (taskLists[index].isCompleted) {
        taskLists.removeAt(index);
      }
    });
  }

  // Function to mark a task as completed
  void taskCompletion(int index) {
    setState(() {
      taskLists[index].taskCompleted();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text(
          'To Do App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: addTasks,
            icon: const Icon(
              Icons.add_box,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: taskLists.isEmpty
          ? const Center(
              child: Text(
                'No tasks added yet',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )
          : ListView.builder(
              itemCount: taskLists.length,
              itemBuilder: (context, counter) {
                if (taskLists[counter].isCompleted) {
                  //               can use SizedBox.shrink instead of Container
                  return SizedBox.shrink();
                }

                return GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Delete Task"),
                        content: const Text("Do you want to delete this task?"),
                        actions: [
                          TextButton(
                            child: const Text("No"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: const Text("Yes"),
                            onPressed: () {
                              setState(() {
                                taskLists.removeAt(counter);
                                Navigator.pop(context);
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Taskpage(
                          onTaskCompletion: taskCompletion,
                          task: taskLists[counter],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: 65,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        "Task No : ${taskLists[counter].taskNo}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          taskLists.isEmpty
              ? showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    title: Text("There are no completed tasks."),
                    content: Text(
                        "Please complete a task to see the completed tasks."),
                  ),
                )
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Completedtasks(
                      taskIndex: counter,
                      taskLists_Completed: completedList(),
                    ),
                  ),
                );
        },
        child: Icon(Icons.keyboard_double_arrow_right_outlined),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
    );
  }
}
