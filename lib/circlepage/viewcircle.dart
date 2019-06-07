import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CirclePage extends StatefulWidget {
  final String circlename;

  CirclePage({Key key, this.circlename}) : super(key: key);

  @override
  _CirclePageState createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.circlename),
        ),
        body: StreamBuilder(
          stream: Firestore.instance
              .collection('circles')
              .document(widget.circlename)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
              child: Container(
                child: Text(snapshot.data['task'][0]['taskname']),
              ),
            );
          },
        ));
  }
}
