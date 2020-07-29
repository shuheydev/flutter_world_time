import 'package:flutter/material.dart';
import 'package:flutter_world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Map data = {};
  void setupWorldTime() async {
    await Future.delayed(Duration(seconds: 5));

    data = ModalRoute.of(context).settings.arguments;

    WorldTime instance;
    if (data == null)
      instance =
          WorldTime(location: 'Tokyo', flag: 'japan.png', url: 'asia/tokyo');
    else
      instance = data['selectedWorldTime'];

    await instance.getTime();

    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'instance': instance,
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDaytime': instance.isDaytime,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
