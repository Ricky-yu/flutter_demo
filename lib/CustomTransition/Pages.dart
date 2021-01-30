import 'package:flutter/material.dart';
import 'package:flutter_demo/CustomTransition/Transition.dart';

class Pages extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('FirstPage', style: TextStyle(fontSize: 36.0)),
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
                child: Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                  size: 64.0,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      CustomFadeTransition(SecondPage())
                  );
                }),
            MaterialButton(
                child: Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                  size: 64.0,
                ),
                onPressed:() {
                Navigator.of(context).push(PageRouteBuilder( //この書き方もあり
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return SecondPage();
                }, transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
                    child: child,
                  );
                }));
              }
            ),
            MaterialButton(
                child: Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                  size: 64.0,
                ),
                onPressed:() {
                  Navigator.of(context).push(
                      CustomScaleTransition(SecondPage())
                  );
                }
            ),
            MaterialButton(
                child: Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                  size: 64.0,
                ),
                onPressed:() {
                  Navigator.of(context).push(
                      CustomRotationTransition(SecondPage())
                  );
                }
            ),
            MaterialButton(
                child: Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                  size: 64.0,
                ),
                onPressed:() {
                  Navigator.of(context).push(
                      CustomSlideTransition(SecondPage())
                  );
                }
            )
          ],
        )
    ),);
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pinkAccent,
        appBar: AppBar(
          title: Text(
            'SecondPage',
            style: TextStyle(fontSize: 36.0),
          ),
          backgroundColor: Colors.pinkAccent,
          leading: Container(),
          elevation: 0.0,
        ),
        body: Center(
          child: MaterialButton(
            child: Icon(Icons.navigate_before, color: Colors.white, size: 64.0),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ));
  }
}
