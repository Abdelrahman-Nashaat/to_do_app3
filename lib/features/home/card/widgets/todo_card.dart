import 'package:flutter/material.dart';

class CardTodolist extends StatelessWidget {
  final String title;
  final String desc;
  final VoidCallback onDelete;

  const CardTodolist(
      {super.key,
      required this.title,
      required this.desc,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
          color: Color(0xff3C1F7B), borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          //Row for name and its title
          children: [
            Row(
              children: [
                Text(
                  'Name :   ',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            )
            // Another Row for Description and its desc
            ,
            Row(
              children: [
                Text(
                  'Description :   ',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  desc,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                IconButton(
                    onPressed: onDelete,
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
