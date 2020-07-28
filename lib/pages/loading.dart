import 'package:flutter/material.dart';
import 'package:flutter_world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    await Future.delayed(Duration(seconds: 5));

    WorldTime instance =
        WorldTime(location: 'Tokyo', flag: 'japan.png', url: 'asia/tokyo');
    await instance.getTime();
    print(instance.time);

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
