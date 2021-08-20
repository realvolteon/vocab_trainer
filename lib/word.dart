import 'package:flutter/material.dart';
import 'consts.dart';

class AddWord extends StatefulWidget {
  const AddWord({Key? key}) : super(key: key);

  @override
  AddWordState createState() => AddWordState();
}

class AddWordState extends State<AddWord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Word")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: DE),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: SE),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: new Icon(Icons.save_outlined),
      ),
    );
  }
}
