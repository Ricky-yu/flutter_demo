import 'package:flutter/material.dart';

class Honor extends StatefulWidget {
  @override
  _HonorState createState() => _HonorState();
}

class _HonorState extends State<Honor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Honor'),
      ),
      body: Container(
        child: Center(
            child: new InkWell(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) {
                      return HonorPage();
                    },
                    fullscreenDialog: true));
              },
              child: new Hero(
                tag: "image",
                child: new Image.network(
                  "https://media.nature.com/lw800/magazine-assets/d41586-020-01443-0/d41586-020-01443-0_17985512.jpg",
                  fit: BoxFit.cover,
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            )
        ),
      ),
    );
  }
}


class HonorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: new InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: new Container(
          alignment: Alignment.center,
          child: new Hero(
              tag: "image",
              child: new Image.network(
                "https://media.nature.com/lw800/magazine-assets/d41586-020-01443-0/d41586-020-01443-0_17985512.jpg",
                fit: BoxFit.cover,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .width,
              )),
        ),
      ),
    );
  }
}