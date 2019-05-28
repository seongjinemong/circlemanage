import 'package:flutter/material.dart';
import 'package:circlemanage/resource/dimen.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int circlenum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Circles You\'re In'),
      ),
      body: SingleChildScrollView(
        child:Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: <Widget>[
            circles(),
            circles(),
            circles(),
            circles(),
            circles(),
            circles(),
            circles(),
            circles(),
            circles(),
          ],
        ),
          ),
      ),
      )
    );
  }

  Widget circles () {

    circlenum++;

    return Container(
              height: 180,
              width: 150,
              child: RaisedButton(
                  elevation: Dimen.elevation,
                  highlightElevation: Dimen.highlightelevation,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: Text("Circle" + circlenum.toString()),
                  onPressed: () {},
                ),
            );
  }
}