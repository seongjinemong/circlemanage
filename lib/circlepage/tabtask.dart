import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TabTask extends StatefulWidget {
  @override
  _TabTaskState createState() => _TabTaskState();
}

class _TabTaskState extends State<TabTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: Firestore.instance.collection(path), builder: null),
    );
  }
}
