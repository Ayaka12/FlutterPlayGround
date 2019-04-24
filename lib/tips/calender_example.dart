import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

class CalenderExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalenderExampleState();
  }
}

class _CalenderExampleState extends State<CalenderExample> {
  DateTime _currentDate = DateTime.now();
  EventList<Event> _markedDateMap = EventList<Event>();

  void onDayPressed(DateTime date, List<Event> events) {
    this.setState(() => _currentDate = date);
    if (events.length == 0) {
      Fluttertoast.showToast(msg: date.toString());
      addEvent(date);
    } else {
      Fluttertoast.showToast(msg: events[0].title);
    }
    // addEvent(date);
  }

  void addEvent(DateTime date) {
    _markedDateMap.add(date, createEvent(date));
  }

  Event createEvent(DateTime date) {
    return Event(
        date: date,
        title: date.day.toString(),
        icon: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blue, width: 1.0)),
            child: Icon(
              Icons.calendar_today,
              color: Colors.blue,
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Calender Example"),
        ),
        body: Container(
          child: CalendarCarousel<Event>(
              onDayPressed: onDayPressed,
              weekendTextStyle: TextStyle(color: Colors.red),
              thisMonthDayBorderColor: Colors.grey,
              weekFormat: false,
              height: 420.0,
              selectedDateTime: _currentDate,
              daysHaveCircularBorder: false,
              customGridViewPhysics: NeverScrollableScrollPhysics(),
              markedDatesMap: _markedDateMap,
              markedDateShowIcon: true,
              markedDateIconMaxShown: 2,
              todayTextStyle: TextStyle(
                color: Colors.blue,
              ),
              markedDateIconBuilder: (event) {
                return event.icon;
              },
              todayBorderColor: Colors.green,
              markedDateMoreShowTotal: false),
        ));
  }
}
