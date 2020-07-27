import 'package:flutter/material.dart';
import 'package:flutter_world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
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
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(
          'loading',
        ),
      ),
    );
  }
}
