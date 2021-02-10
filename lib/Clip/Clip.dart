import 'package:flutter/material.dart';


class Clip extends StatefulWidget {
  @override
  _ClipState createState() => _ClipState();
}

class _ClipState extends State<Clip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Crip')
      ),
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: BottomClipper(),
            child: Container(
              color: Colors.deepPurpleAccent,
              height: 200.0,
            ),
          ),
          RaisedButton(
            child: Text('Login'),
            onPressed: (){

            },
            splashColor: Colors.grey,
            elevation: 12.0,
            textColor: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path>{
  
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height-30);

    var firstControlPoint = Offset(size.width/2, size.height);
    var secondControlPoint = Offset(size.width, size.height-30);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, secondControlPoint.dx, secondControlPoint.dy);

    path.lineTo(size.width, size.height-30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}