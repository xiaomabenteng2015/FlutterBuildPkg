import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gomobile_ios/gomobile_ios.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _sayHi = 'Unknown';
  final _gomobileDemoPlugin = GomobileIos();

  @override
  void initState() {
    super.initState();
    initPlatformState();
    initSayHiState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await _gomobileDemoPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> initSayHiState() async {
    String sayHi;
    try {
      sayHi = await _gomobileDemoPlugin.getSayHi('你好') ??
          'Unknown platform version';
    } on PlatformException {
      sayHi = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      _sayHi = sayHi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on: $_platformVersion\n'),
              Text('Hi: $_sayHi\n'),
            ],
          ),
        ),
      ),
    );
  }
}