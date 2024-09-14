/*import 'package:flutter/material.dart';

class HomeScrean extends StatelessWidget {
  const HomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("on.time"),
        actions: [
          Icon(Icons.notifications),
          Icon(Icons.more_vert_outlined),
        ],
      ),
    );
}}*/
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/database/local_db.dart';
import 'package:flutter_application_1/core/task.dart';
import 'package:flutter_application_1/core/tesk_api.dart';
import 'package:flutter_application_1/features/add_task/add_task_screan.dart';

import '../tabs_for_tabpar/schedule/schedule.dart';
import '../tabs_for_tabpar/note/note.dart';

class HomeScrean extends StatefulWidget {
  const HomeScrean({super.key});

  @override
  _HomeScrean createState() => _HomeScrean();
}

class _HomeScrean extends State<HomeScrean>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<Task> tasks = [];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
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
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Color(0xff2A2A2E),
            Color(0xff1F1338),
            Color(0xff0D0817),
            Color(0xff050309),
            Color(0xff000000),
          ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              "on.time",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: const [
              Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      // height: 50,
                      width: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: const Color(0xff3C1F7B),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: TabBar(
                              unselectedLabelColor: Colors.white,
                              labelColor: Colors.white,
                              indicatorColor: Colors.transparent,
                              indicatorWeight: 2,
                              indicator: BoxDecoration(
                                color: const Color(0xff272430),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              controller: tabController,
                              tabs: const [
                                Tab(
                                  text: '           Schedule                ',
                                ),
                                Tab(
                                  text: '                Note                ',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: const [
                          Tab1(),
                          Tab2(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () async {
                final res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddTaskScreen()));

                if (res != null) {
                  //3
                  final createdTask = await teskApi.addTask(
                      title: res['title'],
                      description: res['description'],
                      date: DateTime.now());
                  tasks.add(createdTask);
                }
              })),
    );
  }
}
