import 'package:flutter/material.dart';
import 'package:todo_app/controller/todo_controller.dart';
import 'package:todo_app/model/todo_model.dart';

class Listview extends StatefulWidget {
  Listview({super.key, required this.todoitemKey, this.onDelete});

  final todoitemKey;
  final void Function()? onDelete;
  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              TodoController.getdata(widget.todoitemKey)!.title,
              style: isChecked == false
                  ? TextStyle(color: Colors.black, fontSize: 20)
                  : TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 20),
            ),
          ),
          isChecked == false ? Text("Incompleted") : Text("Completed"),
          Spacer(),
          IconButton(onPressed: widget.onDelete, icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
