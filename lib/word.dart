import 'package:flutter/material.dart';

class Word extends StatefulWidget {
  const Word({Key? key}) : super(key: key);

  @override
  _WordState createState() => _WordState();
}

class _WordState extends State<Word> {
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
              decoration: InputDecoration(labelText: "Deutsch"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Schwedisch"),
            ),
          )
        ],
      ),
    );
  }
}
