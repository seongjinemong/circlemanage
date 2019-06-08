import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:circlemanage/circlepage/newtask.dart';

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

  String _newtaskname;
  var _newtaskstat;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(widget.circlename),
            ),
            FlatButton(
              child: Icon(
                Icons.add_box,
                color: Colors.white,
              ),
              onPressed: () => {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return NewTask(
                          circlename: widget.circlename,
                        );
                      },
                    ),
                  },
            ),
          ],
        ),
        elevation: 20.0,
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('circles')
            .document(widget.circlename)
            .collection('task')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          return ListView.builder(
            itemExtent: 140.0,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) =>
                _buildListItem(context, snapshot.data.documents[index], index),
          );
        },
      ),
    );
  }

  Widget _buildListItem(
      BuildContext context, DocumentSnapshot document, var index) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.white,
          elevation: 20.0,
          highlightElevation: 5.0,
          padding: EdgeInsets.all(10.0),
          onPressed: () => {},
          child: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    document['taskname'],
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _taskstat(
                      document, document['taskstat'], index) //<Widget>[
                  /*
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.lightBlue,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Text(
                        'Prepare',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    onPressed: () => {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.lightBlue,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Text(
                          'Proceed',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.lightBlue,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Text(
                          'Complete',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                  */
                  //],
                  ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _taskstat(DocumentSnapshot document, var taskstat, var index) {
    List<Widget> list = [];

    if (taskstat == 0) {
      list.add(
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.lightBlue,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: Text(
              'Prepare',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          onPressed: () => {},
        ),
      );
      list.add(
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Text(
                'Proceed',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            onPressed: () => {
                  document.reference.updateData(
                    {
                      'taskstat': 1,
                    },
                  ),
                },
          ),
        ),
      );
      list.add(
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Text(
                'Complete',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            onPressed: () => {
                  document.reference.updateData(
                    {
                      'taskstat': 2,
                    },
                  ),
                },
          ),
        ),
      );
    } else if (taskstat == 1) {
      list.add(
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: Text(
              'Prepare',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          onPressed: () => {
                document.reference.updateData(
                  {
                    'taskstat': 0,
                  },
                ),
              },
        ),
      );
      list.add(
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.lightBlue,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Text(
                'Proceed',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            onPressed: () => {},
          ),
        ),
      );
      list.add(
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Text(
                'Complete',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            onPressed: () => {
                  document.reference.updateData(
                    {
                      'taskstat': 2,
                    },
                  ),
                },
          ),
        ),
      );
    } else if (taskstat == 2) {
      list.add(
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: Text(
              'Prepare',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          onPressed: () => {
                document.reference.updateData(
                  {
                    'taskstat': 0,
                  },
                ),
              },
        ),
      );
      list.add(
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Text(
                'Proceed',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            onPressed: () => {
                  document.reference.updateData(
                    {
                      'taskstat': 1,
                    },
                  ),
                },
          ),
        ),
      );
      list.add(
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.lightBlue,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Text(
                'Complete',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            onPressed: () => {},
          ),
        ),
      );
    }

    return list;
  }
}
