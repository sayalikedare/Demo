import 'package:flutter/material.dart';
import 'package:listview_demo/getApi.dart';
import 'package:listview_demo/listViewBuilder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GetApiWithListview(),
      //ListViewBuilder(),
      // ListViewDemo(),
    );
  }
}
