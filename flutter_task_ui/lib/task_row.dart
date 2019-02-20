import 'package:flutter/material.dart';
import 'package:flutter_task_ui/task.dart';

class TaskRow extends StatefulWidget {
  final Task task;
  final double dotSize = 12.0;

  const TaskRow({Key key, this.task}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new TaskRowState();
  }
}

class TaskRowState extends State<TaskRow> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: new Row(
        children: <Widget>[
          new Padding(
            padding:
            new EdgeInsets.symmetric(horizontal: 32.0 - widget.dotSize / 2),
            child: new Container(
              height: widget.dotSize,
              width: widget.dotSize,
              decoration: BoxDecoration(
                  color: widget.task.color, shape: BoxShape.circle),
            ),
          ),
          new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    widget.task.name,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  new Text(
                    widget.task.category,
                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                  )
                ],
              )),
          new Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              widget.task.time,
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}