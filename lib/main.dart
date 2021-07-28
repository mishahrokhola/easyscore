import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(backgroundColor: Color.fromRGBO(0, 0, 0, 0.2), actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings))
        ]),
        body: Row(children: [
          Expanded(
            flex: 1, // 20%
            child: ScoreWidget(color: Colors.blue),
          ),
          Expanded(
            flex: 1, // 20%
            child: ScoreWidget(color: Colors.red),
          ),
        ]));
  }
}

class ScoreWidget extends StatefulWidget {
  final Color color;

  ScoreWidget({Key? key, required this.color}) : super(key: key);

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<ScoreWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(widget.color),
              splashFactory: NoSplash.splashFactory,
              elevation: MaterialStateProperty.all<double>(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: Colors.transparent)))),
          onPressed: _incrementCounter,
          child: Text('$_counter', style: TextStyle(fontSize: 65))),
    );
  }
}
