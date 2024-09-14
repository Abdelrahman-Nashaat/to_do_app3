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
    return Scaffold(
     
        appBar: AppBar(
          title: Text("add your todo list",),
        ),




        
        body: SafeArea(
          
            child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add Ne Task",style: Theme.of(context).textTheme.titleLarge,),
                
                SizedBox(
                  height: 4,
                ),
              Text("Add New task to be scheduled blah blah blah",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.outline
              ),),
              SizedBox(height: 16,),
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
                  decoration: InputDecoration(
                      labelText: "title", ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: desccontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter a Description ";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Description", ),
                ),
            
                SizedBox(
                  height: 10,
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
                      child: Text("add task ")),
                )
              ],
            ),
          ),
        )));
  }
}