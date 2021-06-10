class Student {
  String _name;
  String _email;
  String _pass;
  String _course;
  String _branch;
  String _year;

  Student(this._name, this._email, this._pass, this._course, this._branch,
      this._year);

  Map<String, dynamic> toJson() {
    return {
      'name': this._name,
      'email': this._email,
      'pass': this._pass,
      'course': this._course,
      'branch': this._branch,
      'year': this._year
    };
  }

  void setStudent(Student student) {
    this._name = student._name;
    this._branch = student._branch;
    this._year = student._year;
    this._pass = student._pass;
    this._course = student._course;
    this._email = student._email;
  }

  String get year => _year;

  String get branch => _branch;

  String get course => _course;

  String get pass => _pass;

  String get email => _email;

  String get name => _name;

  String getId() {
    return course + branch + year;
  }
}
