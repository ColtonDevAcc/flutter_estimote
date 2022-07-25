import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_estimote/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  dynamic data;
  @override
  Widget build(BuildContext context) {
    log("$data");

    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.sync),
          onPressed: () async {
            dynamic _data = await TestAPI().getData({"Beacon": "Beacon"});

            setState(() => data = _data);
          },
        ),
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Data: $data\n'),
        ),
      ),
    );
  }
}
