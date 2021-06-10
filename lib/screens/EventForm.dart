import 'package:flutter/material.dart';
import 'package:schedular/Database%20Manager/DatabaseManager.dart';
import 'package:schedular/model/Timetable.dart';
import 'package:schedular/screens/auth_provider.dart';
import 'package:schedular/shared/constants.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final _formKey = GlobalKey<FormState>();
  final List<String> branch = ['CSE', 'ME', 'CE', 'ECE', 'EEE'];

  Timetable timetable;

  // form values
  String _subject;
  String _startTime;
  String _endTime;
  String _link;
  String _branchSelected;
  String _daySelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Event"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Add new Event',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Enter Day' : null,
                  onChanged: (val) => setState(() => _daySelected = val),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Enter Subject' : null,
                  onChanged: (val) => setState(() => _subject = val),
                ),
                SizedBox(height: 10.0),
                DropdownButtonFormField(
                  value: _branchSelected ?? 'CSE',
                  decoration: textInputDecoration,
                  items: branch.map((branch) {
                    return DropdownMenuItem(
                      value: branch,
                      child: Text('$branch'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _branchSelected = val),
                ),
                SizedBox(height: 20.0),
                // Row(
                //   children: [
                //     TextFormField(
                //       //decoration: textInputDecoration,
                //       validator: (val) => val.isEmpty ? 'Start Time' : null,
                //       onChanged: (val) => setState(() => _startTime = val),
                //     ),
                //     SizedBox(height: 20.0),
                //     TextFormField(
                //       //decoration: textInputDecoration,
                //       validator: (val) => val.isEmpty ? 'End Time' : null,
                //       onChanged: (val) => setState(() => _endTime = val),
                //     ),
                //   ],
                // ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Enter Zoom Link' : null,
                  onChanged: (val) => setState(() => _link = val),
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      //send data to firebase

                      if ( //_subject != null &&
                          //_startTime != null &&
                          // _endTime != null &&
                          //_link != null &&
                          //_branchSelected != null &&
                          // _daySelected != null)
                          1 == 1) {
                        timetable = new Timetable(_branchSelected, _daySelected,
                            _subject, "_startTime", "endTime", _link);

                        setState(() {
                          Database(AuthClass().getCurrentUser()).sendTimetable(
                              "BTechCSEIYear", timetable.toJson());
                        });
                      }

                      // print(_subject);
                      // print(_branchSelected);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
