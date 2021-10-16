// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Messaging App",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Messaging App"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  List messageList = [];
  TextEditingController t1 = TextEditingController();

  collectMessage(String metin) {
    setState(() {
      messageList.insert(0, t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemBuilder: (context, indeksNo) => Text(messageList[indeksNo]),
              reverse: true,
              itemCount: messageList.length,
              
            ),
          ),
          Row(
            children: [
              Flexible(
                child: TextField(
                  controller: t1,
                  onSubmitted: collectMessage,
                ),
              ),
              ElevatedButton(child: Text("Send"),onPressed:(){ collectMessage(t1.text);} ),
            ],
          ),
        ],
      ),
    );
  }
}
