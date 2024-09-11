import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool isCompleted;
  Function(bool?)? onChanged;

  ToDoTile({super.key, required this.taskName, required this.isCompleted, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.yellow,

        ),
        child: Row(
          children: [
            Checkbox(value: isCompleted, onChanged: onChanged),
            Text(taskName),
          ],
        ),
      ),
    );
  }
}
