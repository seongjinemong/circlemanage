import 'package:flutter/material.dart';
import 'package:circlemanage/resource/dimen.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Circles You\'re In'),
      ),
      body: SingleChildScrollView(
        child:Center(
          child: Container(
            padding: EdgeInsets.only(top: 30, bottom: 20),
            child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: <Widget>[
            Container(
              height: 200,
              width: 170,
              child: RaisedButton(
                  elevation: Dimen.elevation,
                  highlightElevation: Dimen.highlightelevation,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: Text("Circle 1"),
                  onPressed: () {},
                ),
            ),
            Container(
              height: 200,
              width: 170,
              child: RaisedButton(
                  elevation: Dimen.elevation,
                  highlightElevation: Dimen.highlightelevation,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: Text("Circle 1"),
                  onPressed: () {},
                ),
            ),
            Container(
              height: 200,
              width: 170,
              child: RaisedButton(
                  elevation: Dimen.elevation,
                  highlightElevation: Dimen.highlightelevation,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: Text("Circle 1"),
                  onPressed: () {},
                ),
            ),
            Container(
              height: 200,
              width: 170,
              child: RaisedButton(
                  elevation: Dimen.elevation,
                  highlightElevation: Dimen.highlightelevation,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: Text("Circle 1"),
                  onPressed: () {},
                ),
            ),
            Container(
              height: 200,
              width: 170,
              child: RaisedButton(
                  elevation: Dimen.elevation,
                  highlightElevation: Dimen.highlightelevation,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: Text("Circle 1"),
                  onPressed: () {},
                ),
            ),
            Container(
              height: 200,
              width: 170,
              child: RaisedButton(
                  elevation: Dimen.elevation,
                  highlightElevation: Dimen.highlightelevation,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: Text("Circle 1"),
                  onPressed: () {},
                ),
            ),
            Container(
              height: 200,
              width: 170,
              child: RaisedButton(
                  elevation: Dimen.elevation,
                  highlightElevation: Dimen.highlightelevation,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: Text("Circle 1"),
                  onPressed: () {},
                ),
            ),
          ],
        ),
          ),
      ),
      )
    );
  }
}