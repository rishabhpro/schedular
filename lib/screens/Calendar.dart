import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:schedular/Database%20Manager/DatabaseManager.dart';
import 'package:schedular/model/student.dart';
import 'package:schedular/screens/auth_provider.dart';
import 'package:schedular/shared/loading.dart';
import 'package:table_calendar/table_calendar.dart';

//error Rendering Failed
class Calendar extends StatefulWidget {
  const Calendar({Key key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  String id;
  final CollectionReference timetableReference =
      FirebaseFirestore.instance.collection('TimeTable');

  @override
  Widget build(BuildContext context) {
    //Event Showing Panel
    // void _showEventsPanel() {
    //   showModalBottomSheet(
    //       context: context,
    //       builder: (context) {
    //         return Container(
    //           padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
    //           child: EventsPage(),
    //         );
    //       });
    // }

    return StreamBuilder<Student>(
      stream: Database(AuthClass().getCurrentUser()).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Student student = snapshot.data;

          id = student.course + student.branch + student.year;

          return Column(
            children: [
              TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime(1990),
                lastDay: DateTime(2050),
                startingDayOfWeek: StartingDayOfWeek.monday,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  headerPadding: EdgeInsets.only(left: 400, right: 400),
                  headerMargin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                ),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectDay;
                    _focusedDay =
                        focusedDay; // update `_focusedDay` here as well
                  });
                },
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: Colors.white),
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                _selectedDay.day.toString() +
                                    "/" +
                                    _selectedDay.month.toString() +
                                    "/" +
                                    _selectedDay.year.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: [
                              // dayTask("10am", "Data Compression", "11am"),
                              // dayTask("12am", "Machine Learning", "1am"),
                              // dayTask("2am", "Michael Hamilton"),

                              Expanded(
                                child: StreamBuilder(
                                    stream: timetableReference.snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView();
                                      } else {
                                        return Center(
                                          child: Text("No Data"),
                                        );
                                      }
                                    }),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () => _showEventsPanel(),
          //   child: Text(
          //     "+",
          //     style: TextStyle(
          //       fontSize: 20,
          //     ),
          //   ),
          // ),

        } else {
          return Loading();
        }
      },
    );
  }

  //showing data at the bottom
  Row dayTask(String time, String name, String end) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width * 0.2,
          child: Text(
            time,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
            child: Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.all(20),
          color: Color(0xffdfdeff),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    color: Colors.purple, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.timer,
                    color: Colors.purple,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("$time - $end",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 13,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ))
      ],
    );
  }
}
