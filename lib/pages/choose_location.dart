import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;
  double elevation = 0;

  void getData() {
    //simulate network request for a username.
    Future.delayed(Duration(seconds: 3), () {
      print('田中');
    });

    Future.delayed(Duration(seconds: 2), () {
      print('菜食主義者, ミュージシャン, 卵収集家');
    });

    print('statement');
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
