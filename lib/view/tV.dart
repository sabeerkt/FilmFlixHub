import 'package:flutter/material.dart';

class tV extends StatefulWidget {
  const tV({super.key});

  @override
  State<tV> createState() => _tVState();
}

class _tVState extends State<tV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("tv"),),
      body: Column(children: [
        Text("moviiee")

      ],),
    );
  }
}