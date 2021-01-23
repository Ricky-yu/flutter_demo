import 'package:flutter/material.dart';
import 'package:flutter_demo/home_screen.dart';
import 'package:flutter_demo/email_screen.dart';
import 'package:flutter_demo/airplay_screen.dart';
import 'package:flutter_demo/pages_screen.dart';

class  BottomNavigationWidget extends StatefulWidget {
   createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final BOTTOMNAVIGATIONCOLOR = Colors.blue;
  int currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState(){
    list
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(AirplayScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: BOTTOMNAVIGATIONCOLOR,
              ),
            // ignore: deprecated_member_use
            title: Text(
              'Home',
              style: TextStyle(color: BOTTOMNAVIGATIONCOLOR),
            )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: BOTTOMNAVIGATIONCOLOR,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'email',
                style: TextStyle(color: BOTTOMNAVIGATIONCOLOR),
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pages,
                color: BOTTOMNAVIGATIONCOLOR,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Pages',
                style: TextStyle(color: BOTTOMNAVIGATIONCOLOR),
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.airplay,
                color: BOTTOMNAVIGATIONCOLOR,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'AirPlay',
                style: TextStyle(color: BOTTOMNAVIGATIONCOLOR),
              )
          ),
        ],
        currentIndex: this.currentIndex,
        onTap: (int index){
          setState(() {
            this.currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
