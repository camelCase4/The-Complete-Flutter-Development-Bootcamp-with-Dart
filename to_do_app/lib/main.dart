import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const ToDo());
}

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  bool isChecked = false;
  String taskInput = "";
  List<String> taskNames = ['Create a task App','love my gf','ride with friends','yagats','manginhas','work','manaygon'];
  List<bool> isDone = [true,true,true,true,true,true,true];
  List<int> unchecker = [0,0,0,0,0,0,0];
  int count = 1;
 

  Widget toDoes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 0; i < taskNames.length; i++)
          CheckboxListTile(
            title: Text(
              taskNames[i],
              style: TextStyle(
                  decoration: isDone[i]
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,fontSize: 17),
            ),
            value: isDone[i] ? true : false,
            onChanged: (bool? value) {
              value = true;
              setState(() {
                isDone[i] = true;
                unchecker[i]++;
                if(unchecker[i] == 2)
                {
                  isDone[i] = false;
                  unchecker[i] = 0;
                  
                }
              });
            },
            
          ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return MaterialApp(
      debugShowCheckedModeBanner: false, //no error
      home: Builder(builder: (context) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.lightBlueAccent,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true, //
                  context: context,
                  builder: (_) {
                    return Padding(
                      padding: MediaQuery.of(context)
                          .viewInsets, //returned padding istead of container
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Add Task",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 25),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(5, 15, 5, 0),
                              width: 250,
                              child: TextField(
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  taskInput = value;
                                },
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Enter Task",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                ),
                                onPressed: () {
                                  if (taskInput != "") {
                                    taskNames.add(taskInput);
                                    isDone.add(false);
                                    unchecker.add(0);
                                    Navigator.pop(context);
                                    setState(() {
                                      count++;
                                    });
                                  } else {
                                    print("no input");
                                  }
                                },
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(100, 8, 100, 8),
                                  child: Text(
                                    "ADD",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: const Icon(Icons.add),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.list,
                          color: Colors.lightBlue,
                          size: 40,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 20, 8, 8),
                      child: Text(
                        "Todoey",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "$count Tasks",
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: toDoes(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
