import 'package:flutter/material.dart';
import 'package:todo_app/controller/todo_controller.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/view/listview/listview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController addcobtroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    TodoController.initKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: Text("ToDo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
          centerTitle: true,
          actions: [Icon(Icons.search)],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              // Expanded(
              //   child: Column(
              //     children: List.generate(1, (index) => Listview()),
              //   ),
              // ),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Listview(
                          todoitemKey: TodoController.todolistKey[index],
                          onDelete: () async {
                            await TodoController.deleteData(
                                TodoController.todolistKey[index]);
                            setState(() {});
                          },
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                    itemCount: TodoController.todolistKey.length),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text("Add to task",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(
                      minRadius: 30,
                      child: IconButton(
                          onPressed: () {
                            addcobtroller.clear();
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Add"),
                                content: Form(
                                  key: formKey,
                                  child: TextFormField(
                                    controller: addcobtroller,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          await TodoController.addData(
                                              TodoModel(
                                                  title: addcobtroller.text,
                                                  completed: false));
                                          setState(() {});
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Text("Ok"))
                                ],
                              ),
                            );
                          },
                          icon: Icon(Icons.add)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
