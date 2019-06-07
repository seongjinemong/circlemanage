import 'package:flutter/material.dart';
import 'package:circlemanage/resource/dimen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  final FirebaseUser user;

  HomePage({Key key, this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int circlenum = 0;
  String _useruid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Circles You\'re In'),
        ),
        body: StreamBuilder(
            stream: Firestore.instance
                .collection('users')
                .document(widget.user.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return LinearProgressIndicator();
              }
              return Center(
                child: Container(
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: <Widget>[
                      /*
                      if (snapshot
                              .data
                              .documents[widget.user.uid]['circlenames']
                              .length ==
                          0)
                        Text('No circles to display...!!')
                      else

                          )
                          */
                      for (var i = 0;
                          i < snapshot.data['circlenames'].length;
                          i++)
                        Container(
                            height: 180,
                            width: 150,
                            child: RaisedButton(
                              elevation: 15.0,
                              highlightElevation: 5.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              color: Colors.blue,
                              child: Text(
                                snapshot.data['circlenames'][i],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {},
                            ))
                    ],
                  ),
                ),
              );
            }));
  }

  /*
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
  */
}
