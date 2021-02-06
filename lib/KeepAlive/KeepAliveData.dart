import 'package:flutter/material.dart';
import 'package:flutter_demo/KeepAlive/HomePage.dart';


class KeepAliveData extends StatefulWidget {
  @override
  _KeepAliveDataState createState() => _KeepAliveDataState();
}

class _KeepAliveDataState extends State<KeepAliveData> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispore() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KeepAlive'),
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike))
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          HomePage(),
          HomePage()
        ],
      ),
    );
  }
}
