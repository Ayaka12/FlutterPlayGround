import 'package:flutter/material.dart';
import 'package:flutter_play_ground/main/card_item.dart';
import 'package:flutter_play_ground/tips/calender_example.dart';
import 'package:flutter_play_ground/tips/chart_example.dart';
import 'package:flutter_play_ground/tips/mobile_vision_example.dart';

void main() => runApp(MaterialApp(
      title: 'TimeTable',
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<CardItem> cards = [
    CardItem("Calender Example", CalenderExample()),
    CardItem("Chart Example", ChartExample()),
    CardItem("OCR Example", MobileVisionExample()),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Play Ground"),
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return cards[index];
      },
        itemCount: cards.length,
      ),
    );
  }
}
