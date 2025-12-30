import 'package:flutter/material.dart';

class PrestApp extends StatefulWidget {
  const PrestApp({super.key});

  @override
  State<PrestApp> createState() => _PrestAppState();
}

class _PrestAppState extends State<PrestApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'prEST',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('prEST'),
        ),
        body: const Center(
          child: Text(
            "prEST",
            style: TextStyle(fontSize: 34, color: Colors.amberAccent),
          ),
        ),
      ),
    );
  }
}
