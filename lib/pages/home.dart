import 'package:flutter/material.dart';
import 'package:flutter_world_time/services/world_time.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    print('arguments: $data');
    WorldTime wt = data['instance'] as WorldTime;
    print('instance: ${wt.time}');
    print('location: ${data['location']}');

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/location',
                );
              },
              icon: Icon(
                Icons.edit_location,
              ),
              label: Text(
                'Edit location',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
