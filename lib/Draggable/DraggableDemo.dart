import 'package:flutter/material.dart';
import 'DraggableWidget.dart';

class DraggableDemo extends StatefulWidget {
  @override
  _DraggableDemoState createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  Color _draggableColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DraggableDemo')),
      body: Stack(
        children: <Widget>[
          DraggableWidget(
            offset: Offset(120.0, 150.0),
            widgetColor: Colors.tealAccent,
          ),
          DraggableWidget(
            offset: Offset(220.0, 150.0),
            widgetColor: Colors.redAccent,
          ),
          Center(
            child: DragTarget(onAccept: (Color color) {
              _draggableColor = color;
            }, builder: (context, candidateData, rejectedData) {
              return Container(
                width: 200.0,
                height: 200.0,
                color: _draggableColor,
              );
            }),
          )
        ],
      ),
    );
  }
}
