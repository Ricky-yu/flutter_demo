import 'package:flutter/material.dart';
import 'EachView.dart';

class BottomFabWidget extends StatefulWidget {
  @override
  _BottomFabWidgetState createState() => _BottomFabWidgetState();
}

class _BottomFabWidgetState extends State<BottomFabWidget> {
  List<Widget> eachView = List();
  int index = 0;

  @override
  void initState() {
    super.initState();
    eachView..add(EachView('Home'))..add(EachView('AirPlane'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: this.eachView[this.index],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return EachView('New Page');
            }));
          },
          tooltip: 'Increment',
          child: Icon(Icons.add, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.lightBlue,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    index = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.airplanemode_active),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    index = 1;
                  });
                },
              )
            ],
          ),
        ));
  }
}
