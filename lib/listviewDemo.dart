import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({super.key});

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView Demo'),
          centerTitle: true,
        ),
        body: ListView(
          children: const [
            Text("Welcome to listview Example"),
            Text(
                "Its is a listview widget help to add multiple data having same properties"),
            Text('One'),
            Text('Two')
          ],
        ));
  }
}
