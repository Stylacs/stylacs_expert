import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../size_config.dart';

class Datedob extends StatefulWidget {
  @override
  _DatedobState createState() => _DatedobState();
}

class _DatedobState extends State<Datedob> {

  DateTime _currentDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? portraitScreen()
          : landscapScreen(),
    );
  }
  Widget portraitScreen() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: (10 / 3.6) * SizeConfig.widthMultiplier),
        child: Column(
          children: <Widget>[
            Container(
              child: CalendarCarousel<Event>(
                onDayPressed: (DateTime date, List<Event> events) {
                  this.setState(() => _currentDate = date);
                  print(
                      "${date.weekday} : ${date.day}/${date.month}/${date.year}");
                },
                weekendTextStyle: TextStyle(
                  color: Colors.black,
                ),
                selectedDayBorderColor: Colors.grey,
                selectedDayButtonColor: Color.fromRGBO(255, 175, 190, 1),
                thisMonthDayBorderColor: Colors.grey,
                weekdayTextStyle: TextStyle(color: Colors.black),
                todayButtonColor: Colors.black,
//      weekDays: null, /// for pass null when you do not want to render weekDays
//      headerText: Container( /// Example for rendering custom header
//        child: Text('Custom Header'),
//      ),
                // customDayBuilder: (   /// you can provide your own build function to make custom day containers
                //   bool isSelectable,
                //   int index,
                //   bool isSelectedDay,
                //   bool isToday,
                //   bool isPrevMonthDay,
                //   TextStyle textStyle,
                //   bool isNextMonthDay,
                //   bool isThisMonthDay,
                //   DateTime day,
                // ) {
                //     /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
                //     /// This way you can build custom containers for specific days only, leaving rest as default.

                //     // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
                //     if (day.day == 15) {
                //       return Center(
                //         child: Icon(Icons.local_airport),
                //       );
                //     } else {
                //       return null;
                //     }
                // },
                // weekFormat: true,
                // markedDatesMap: _markedDateMap,
                height: (400 / 7.6) * SizeConfig.heightMultiplier,
                width: MediaQuery.of(context).size.width,
                selectedDateTime: _currentDate,
                daysHaveCircularBorder: true,

                /// null for not rendering any border, true for circular border, false for rectangular border
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                      onPressed: () {
                        if (_currentDate != null) {
                          Navigator.of(context).pop(_currentDate);
                          print(_currentDate);
                        } else {
                          Fluttertoast.showToast(
                              msg: "Plz select Appointment Date!!",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER);
                        }
                      },
                      color: Color.fromRGBO(255, 175, 190, 1).withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                              (8 / 7.6) * SizeConfig.heightMultiplier),
                        ),
                      ),
                      child: Text("Done")),
                ),
                // FlatButton(
                //     onPressed: () {
                //       if (_currentDate != null) {
                //         Navigator.of(context).pop(_currentDate);
                //         print(_currentDate);
                //       } else {
                //         Fluttertoast.showToast(
                //             msg: "Plz select Appointment Date!!",
                //             toastLength: Toast.LENGTH_LONG,
                //             gravity: ToastGravity.CENTER);
                //       }
                //     },
                //     color: Colors.pink[300],
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(8))),
                //     child: Text("Cancel"))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget landscapScreen() {
    return Center(
      child: SingleChildScrollView(
              child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: (10 / 3.6) * SizeConfig.widthMultiplier),
          child: Column(
            children: <Widget>[
              Container(
                child: CalendarCarousel<Event>(
                  onDayPressed: (DateTime date, List<Event> events) {
                    this.setState(() => _currentDate = date);
                    Navigator.of(context).pop(_currentDate);

                    print(
                        "${date.weekday} : ${date.day}/${date.month}/${date.year}");
                  },
                  weekendTextStyle: TextStyle(
                    color: Colors.black,
                  ),
                  selectedDayBorderColor: Colors.grey,
                  selectedDayButtonColor: Color.fromRGBO(255, 175, 190, 1),
                  thisMonthDayBorderColor: Colors.grey,
                  weekdayTextStyle: TextStyle(color: Colors.black),
                  todayButtonColor: Colors.black,
//      weekDays: null, /// for pass null when you do not want to render weekDays
//      headerText: Container( /// Example for rendering custom header
//        child: Text('Custom Header'),
//      ),
                  // customDayBuilder: (   /// you can provide your own build function to make custom day containers
                  //   bool isSelectable,
                  //   int index,
                  //   bool isSelectedDay,
                  //   bool isToday,
                  //   bool isPrevMonthDay,
                  //   TextStyle textStyle,
                  //   bool isNextMonthDay,
                  //   bool isThisMonthDay,
                  //   DateTime day,
                  // ) {
                  //     /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
                  //     /// This way you can build custom containers for specific days only, leaving rest as default.

                  //     // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
                  //     if (day.day == 15) {
                  //       return Center(
                  //         child: Icon(Icons.local_airport),
                  //       );
                  //     } else {
                  //       return null;
                  //     }
                  // },
                  // weekFormat: true,
                  // markedDatesMap: _markedDateMap,
                  height: (300 / 7.6) * SizeConfig.heightMultiplier,
                  width: MediaQuery.of(context).size.width,
                  selectedDateTime: _currentDate,
                  daysHaveCircularBorder: true,

                  /// null for not rendering any border, true for circular border, false for rectangular border
                ),
              ),
              SizedBox(height: (20/7.6) * SizeConfig.heightMultiplier,)
            ],
          ),
        ),
      ),
    );
  }


}