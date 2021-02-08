import 'package:flutter/material.dart';


class WrapList extends StatefulWidget {
  @override
  _WrapListState createState() => _WrapListState();
}

class _WrapListState extends State<WrapList> {
  List<Widget> list;

  @override
  void initState() {
    super.initState();
    list = List<Widget>()..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          title: Text('WrapList')
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: screenWidth,
            height: screenHeight/2,
            color: Colors.grey,
            child: Wrap(
              children: list,
              spacing: 50.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAddButton(){
    return GestureDetector(
      onTap: (){
        if (list.length<9){
          setState(() {
            list.insert(list.length-1, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black54,
          child: Icon(Icons.add)
        ),
      ),
    );
  }

  Widget buildPhoto(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.amber,
          child: Center(
            child: Text('PHOTO'),
          )
      ),
    );
  }
}
