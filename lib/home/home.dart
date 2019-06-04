import 'package:flutter/material.dart';
import 'package:circlemanage/resource/dimen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int circlenum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Circles You\'re In'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Wrap(spacing: 20, runSpacing: 20, children: circle()),
            ),
          ),
        ));
  }

  List<Widget> circle() {
    List<Widget> list = [];
    List circlenames = [];
    int a;

    Firestore.instance
        .collection('Test')
        .document('g75zuQgGvbXyeJ7UB9ax')
        .get()
        .then((DocumentSnapshot ds) {
      print('Got Document!!');
      a = ds.data["circles"];
      for (int i = 0; i < ds.data["circlenames"].length; i++) {
        circlenames.add(ds.data['circlenames'][i]);
      }

      for (int i = 0; i < circlenames.length; i++) {
        list.add(Container(
          height: 180,
          width: 150,
          child: RaisedButton(
            elevation: Dimen.elevation,
            highlightElevation: Dimen.highlightelevation,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Colors.blue,
            child: Text(circlenames[i]),
            onPressed: () {},
          ),
        ));
      }

      //list.add(Text())

      return list;
    });
  }

  Widget circles() {
    circlenum++;

    return Container(
      height: 180,
      width: 150,
      child: RaisedButton(
        elevation: Dimen.elevation,
        highlightElevation: Dimen.highlightelevation,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.blue,
        child: Text("Circle" + circlenum.toString()),
        onPressed: () {},
      ),
    );
  }
}
