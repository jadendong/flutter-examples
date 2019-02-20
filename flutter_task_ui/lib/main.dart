import 'package:flutter/material.dart';
import 'package:flutter_task_ui/diagonal_clipper.dart';
import 'package:flutter_task_ui/task.dart';
import 'package:flutter_task_ui/task_row.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double _imageHeight = 256.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          _buildTimeline(),
          _buildImage(),
          _buildTopHeader(),
          _buildProfileRow(),
          _buildBottomPart(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return new ClipPath(
      clipper: new DialogClipper(),
      child: new Image.network(
        'https://img2.mukewang.com/szimg/5b723de80001ec9b05400300.jpg',
        fit: BoxFit.fitHeight,
        height: _imageHeight,
        color: Color.fromARGB(120, 20, 10, 40),
        colorBlendMode: BlendMode.srcOver,
      ),
    );
  }

  Widget _buildTopHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
      child: Row(
        children: <Widget>[
          new Icon(
            Icons.menu,
            size: 32.0,
            color: Colors.white,
          ),
          new Expanded(
              child: new Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: new Text(
              'Timeline',
              style: new TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          )),
          new Icon(
            Icons.linear_scale,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _buildProfileRow() {
    return new Padding(
      padding: EdgeInsets.only(left: 16.0, top: _imageHeight / 2.5),
      child: new Row(
        children: <Widget>[
          new CircleAvatar(
              minRadius: 28.0,
              maxRadius: 28.0,
              backgroundImage: new NetworkImage(
                  'https://avatars2.githubusercontent.com/u/14342176?s=400&u=d6c1848af82d9f882153ab934d1b7d9204a1e657&v=4')),
          new Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(
                  'Jaden Dong',
                  style: TextStyle(
                    fontSize: 26.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                new Text(
                  'product designer',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return new Padding(
      padding: EdgeInsets.only(top: _imageHeight),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildMyTasksHeader(),
          _buildTasksList(),
        ],
      ),
    );
  }

  Widget _buildTasksList() {
    return new Expanded(
      child: new ListView(
        children: tasks.map((task) => new TaskRow(task: task)).toList(),
      ),
    );
  }

  Widget _buildMyTasksHeader() {
    return new Padding(
      padding: EdgeInsets.only(left: 64),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            'My Tasks',
            style: TextStyle(fontSize: 34.0),
          ),
          new Text(
            'February 19 2019',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTimeline() {
    return new Positioned(
      top: 0.0,
      bottom: 0.0,
      left: 32.0,
      child: new Container(
        width: 1.0,
        color: Colors.grey[300],
      ),
    );
  }
}

List<Task> tasks = [
  new Task(
      name: "Catch up with Brian",
      category: "Mobile Project",
      time: "5pm",
      color: Colors.orange,
      completed: false),
  new Task(
      name: "Make new icons",
      category: "Web App",
      time: "3pm",
      color: Colors.cyan,
      completed: true),
  new Task(
      name: "Design explorations",
      category: "Company Website",
      time: "2pm",
      color: Colors.pink,
      completed: false),
  new Task(
      name: "Lunch with Mary",
      category: "Grill House",
      time: "12am",
      color: Colors.cyan,
      completed: true),
  new Task(
      name: "Teem Meeting",
      category: "Hangouts",
      time: "10am",
      color: Colors.cyan,
      completed: true),
  new Task(
      name: "Design explorations",
      category: "Company Website",
      time: "2pm",
      color: Colors.pink,
      completed: false),
  new Task(
      name: "Make new icons",
      category: "Web App",
      time: "3pm",
      color: Colors.cyan,
      completed: true),
];
