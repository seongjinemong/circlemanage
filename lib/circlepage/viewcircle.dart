import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:circlemanage/circlepage/tabinfo.dart';
import 'package:circlemanage/circlepage/tabtask.dart';
import 'package:circlemanage/circlepage/tabmemo.dart';

class CirclePage extends StatefulWidget {
  final String circlename;

  CirclePage({Key key, this.circlename}) : super(key: key);

  @override
  _CirclePageState createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage>
    with SingleTickerProviderStateMixin {
  // Create a tab bar controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.circlename),
        ),
        body: new TabBarView(
          // Add tabs as widgets
          children: <Widget>[new TabInfo(), new TabTask(), new TabMemo()],
          // set the controller
          controller: controller,
        ),
        // Set the bottom navigation bar
        bottomNavigationBar: new Material(
          // set the color of the bottom navigation bar
          color: Colors.white,
          // set the tab bar as the child of bottom navigation bar
          child: new TabBar(
            tabs: <Tab>[
              new Tab(
                //icon: new Icon(Icons.check_circle_outline, color: Colors.black45),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Image.asset(
                    'lib/assets/circle_final.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              new Tab(
                //icon: new Icon(Icons.adb, color: Colors.black45),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Image.asset(
                    'lib/assets/check.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              new Tab(
                //icon: new Icon(Icons.airport_shuttle, color: Colors.black45),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Image.asset(
                    'lib/assets/memo.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ],
            // setup the controller
            controller: controller,
          ),
        ));
  }
}
