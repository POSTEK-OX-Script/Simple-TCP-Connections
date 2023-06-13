// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Print Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void main() async {
    final socket = await Socket.connect('199.9.10.216', 12346);
    print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');
    socket.write('Printed from phone');
    //socket.write('来自于电脑的打印');
    socket.listen((data) {
      print(String.fromCharCodes(data).trim());
    });

    // Close the socket when finished
    await socket.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff232323),
        title: Text(widget.title),
      ),
      body: Center(
        child: 
              CupertinoButton.filled(
                  child: const Text("Push To Print"),
                  //child: const Text("发送打印数据"),
                  onPressed: () {
                    main();
                  }),
      ),
    );
  }
}
