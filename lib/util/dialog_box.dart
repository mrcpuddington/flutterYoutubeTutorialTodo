import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(height: 120,
      child: Column(children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Add a new task",
          ),
        ),
        SizedBox(height: 10,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //save button
            ElevatedButton(onPressed: (){}, child: Text("Save")),

            //cancel button
            ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Cancel")),
          ],
        )
      ],),)
    );
  }
}