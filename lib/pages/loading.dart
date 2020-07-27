import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    //make the request
    http.Response response =
        await http.get('http://worldtimeapi.org/api/timezone/Asia/Tokyo');
    Map data = jsonDecode(response.body);
    print(data);

    //get properties from data
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    print(dateTime);
    print(offset);

    //create DateTime object
    DateTime now = DateTime.parse(dateTime);
    int offsetInt = int.parse(offset);
    print(offsetInt);
    print(now);
    now = now.add(Duration(hours: offsetInt));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('loading screen3')),
    );
  }
}
