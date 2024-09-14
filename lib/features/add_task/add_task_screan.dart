import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final formKey = GlobalKey<FormState>();

  String title = '';
  String desc = '';
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController desccontroller = TextEditingController();

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
              "Schedule",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          body: SafeArea(
              child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  Text(
                  //       "Add New one",
                  //  style: TextStyle(color: Colors.white),
                  //           style: Theme.of(context).textTheme.titleLarge,
                  //  ),

                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Add New task to be scheduled ...",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    // style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    //    color: Theme.of(context).colorScheme.outline),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // task extract this textfomfiled as sheared widget
                  //  task stack of nav
                  TextFormField(
                    controller: titlecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter a title";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "title",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: desccontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter a Description ";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "Description",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(
                    height: 55,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pop(context, {
                              "title": titlecontroller.text,
                              "description": desccontroller.text
                            });
                            print("done");
                          }
                        },
                        child: const Text("add task ")),
                  )
                ],
              ),
            ),
          ))),
    );
  }
}
