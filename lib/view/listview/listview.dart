import 'package:flutter/material.dart';
import 'package:todo_app/controller/todo_controller.dart';

class Listview extends StatefulWidget {
  Listview(
      {super.key,
      required this.title,
      this.onDelete,
      required this.category,
      this.onpress,
      required this.isChecked});

  final String title;
  final void Function()? onDelete;
  final void Function(bool?)? onpress;
  final String category;
  final bool isChecked;
  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(value: widget.isChecked, onChanged: widget.onpress
              // (value) {
              //   setState(() {
              //     isChecked = value!;
              //   });
              // },
              ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              widget.title,
              style: widget.isChecked == false
                  ? TextStyle(color: Colors.black, fontSize: 20)
                  : TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 20),
            ),
          ),
          Text(widget.category),
          SizedBox(
            width: 10,
          ),
          widget.isChecked == false ? Text("Incompleted") : Text("Completed"),
          Spacer(),
          IconButton(onPressed: widget.onDelete, icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
