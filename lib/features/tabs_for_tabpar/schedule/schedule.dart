import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/database/local_db.dart';
import 'package:flutter_application_1/core/task.dart';
import 'package:flutter_application_1/core/tesk_api.dart';
import 'package:flutter_application_1/features/home/card/widgets/todo_card.dart';

class Tab1 extends StatefulWidget {
  const Tab1({super.key});

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  //1-
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _initializeDatabaseAndGetTasks();
  }

  Future<void> _initializeDatabaseAndGetTasks() async {
    await getTask();
  }

  //2
  Future<void> getTask() async {
    tasks = await teskApi.getTasks();
    setState(() {});
  }

  Future<void> delteTask(int id) async {
    await updateTaskStatusToDone(id);
    await deleteFromDatabase(id);
    await getTask();
  }

  @override
  Widget build(BuildContext context) {
    // app bar
    //text
    //float
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff3A3372), Color(0xff3A3372)])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              "Taskes                                             ",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: tasks.isEmpty
              ? Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff3C1F7B),
                              borderRadius: BorderRadius.circular(11)),
                          width: 193,
                          height: 36,
                          child: Center(
                            child: Text(
                              'You Didn’t Have Any Schedule.',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FilledButton(onPressed: () {}, child: Text("Button"))
                  ],
                )
              : Padding(
                  padding: EdgeInsets.all(16),
                  child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return CardTodolist(
                          title: tasks[index].title,
                          desc: tasks[index].description,
                          onDelete: () => delteTask(tasks[index].id),
                        );
                      }),
                )),
    );
  }
}
