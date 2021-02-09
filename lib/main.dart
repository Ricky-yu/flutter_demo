import 'package:flutter/material.dart';
import 'BottomNavigation/BottomNavigationWidget.dart';
import 'BottomFloatingActionButton/BottomFAB.dart';
import 'CustomTransition/Pages.dart';
import 'FrostedGlass/FrostedGlass.dart';
import 'KeepAlive/KeepAliveData.dart';
import 'SearchBar/SearchBar.dart';
import 'Wrap/WrapList.dart';
import 'ExpansionPaneList/ExpansionPaneList.dart';

class View {
  final String title;
  final StatefulWidget taget;

  View(this.title, this.taget);
}

void main() {
  runApp(MaterialApp(
    title: 'upload data',
    theme: ThemeData(
      primarySwatch: Colors.lightBlue,
    ),
    home: Views(views: [
      View('BottomNavigationWidget', BottomNavigationWidget()),
      View('BottomFloatingAuctionButtonWidget', BottomFabWidget()),
      View('Transition', Pages()),
      View('FrostedGlassDemo', FrostedGlass()),
      View('KeepAlive', KeepAliveData()),
      View('SearchBar', SearchBar()),
      View('WrapList', WrapList()),
      View('ExpansionList', ExpansionPaneList())
    ]),
  ));
}

class Views extends StatelessWidget {
  // This widget is the root of your application.

  final List<View> views;

  Views({Key key, @required this.views}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Demo')),
        body: ListView.builder(
          itemCount: views.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(views[index].title),
                onTap: () {
                  navigateToItemDetail(context, index);
                });
          },
        ));
  }

  navigateToItemDetail(BuildContext context, int index) async {
    //async是启用异步方法
    final result = await Navigator.push(
        //等待
        context,
        MaterialPageRoute(
          builder: (context) => views[index].taget,
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
