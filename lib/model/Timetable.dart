class Timetable{
  String _id;
  String _day;
  String _subject;
  String _startTime;
  String _endTime;
  String _link;

  Timetable(this._id, this._day, this._subject, this._startTime, this._endTime,
      this._link); // String _course;
  // String _branch;
  // String _year;



  Map<String, dynamic> toJson() {
    return {
      'id': this._id,
      'day': this._day,
      'subject': this._subject,
      'startTime': this._startTime,
      'endTime': this._endTime,
      'link': this._link,
    };
  }

}