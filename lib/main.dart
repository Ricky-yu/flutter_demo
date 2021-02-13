import 'package:flutter/material.dart';
import 'BottomNavigation/BottomNavigationWidget.dart';
import 'BottomFloatingActionButton/BottomFAB.dart';
import 'CustomTransition/Pages.dart';
import 'FrostedGlass/FrostedGlass.dart';
import 'KeepAlive/KeepAliveData.dart';
import 'SearchBar/SearchBar.dart';
import 'Wrap/WrapList.dart';
import 'ExpansionPaneList/ExpansionPaneList.dart';
import 'Clip/Clip.dart';
import 'Draggable/DraggableDemo.dart';
import 'Honor/Honor.dart';
import 'AlertDialog/AlertDialogDemo.dart';

class View {
  final String title;
  final StatefulWidget taget;

  View(this.title, this.taget);
}

void main() {
  runApp(MaterialApp(
    title: 'upload data',
    debugShowCheckedModeBanner: false,
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
      View('ExpansionList', ExpansionPaneList()),
      View('Clip', Clip()),
      View('Draggable', DraggableDemo()),
      View('Honor', Honor()),
      View('AlertDialog', AlertDialogDemo())
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
              return new Card(
                child: new Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              child: ListTile(
                  title: Text(views[index].title),
                  onTap: () {
                    navigateToItemDetail(context, index);
                  }),
            ));
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
