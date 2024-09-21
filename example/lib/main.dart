import 'package:flutter/material.dart';

import 'package:awareframework_gyroscope/awareframework_gyroscope.dart';
import 'package:awareframework_core/awareframework_core.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GyroscopeSensor? sensor;
  GyroscopeSensorConfig? config;

  @override
  void initState() {
    super.initState();

    config = GyroscopeSensorConfig()
      ..frequency = 100
      ..dbType = DatabaseType.DEFAULT
      ..debug = true;

    sensor = new GyroscopeSensor.init(config!);
    sensor?.start();
    sensor?.onDataChanged.listen((data) {
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin Example App'),
        ),
      ),
    );
  }
}
