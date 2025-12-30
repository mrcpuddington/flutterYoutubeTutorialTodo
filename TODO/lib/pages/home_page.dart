import 'package:flutter/material.dart';
import 'package:youtube_tutorial_todo_real/util/dialog_box.dart';
import 'package:youtube_tutorial_todo_real/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

// List of to do tasks
List  toDoList = [
  ["Make tutorial", false],
  ["Do exercise", true],
  ["Play game", false],
];

// Create a new task
void createNewTask(){
  showDialog(context: context, builder: (context) {
    return DialogBox();
    }); 
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Center(child: Text('TO DO')),
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value){
              setState(() {
                toDoList[index][1] = value;
              });
            },
          );
        },
      )
    );
  }
}