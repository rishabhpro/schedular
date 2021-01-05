import 'package:flutter/material.dart';
class Ssp extends StatefulWidget {
  @override
  _SspState createState() => _SspState();
}

class _SspState extends State<Ssp> {
  String dropdownValue = 'CSE';
  String dropdownValueYear = '1st';
  final _text = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   resizeToAvoidBottomPadding: false,
      body: LayoutBuilder(
        builder: (BuildContext context,BoxConstraints viewportConstraints){
          return  Container(
            padding: const EdgeInsets.all(15),
            color: Colors.grey[500],
            width: double.infinity,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Align(
                      child: SafeArea(
                        left: true,
                        bottom: true,
                        right: true,
                        top: true,
                        minimum: const EdgeInsets.all(16.0),
                        child: Text(
                          'Sign up as Student ',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.grey[550],
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: const EdgeInsets.all(15),
                      color: Colors.grey[500],
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextField(
                           // controller: _text,
                            style: TextStyle(fontSize: 20 , color: Colors.black38),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: 'Email Address',
                            //  errorText: _validate ? 'Value Can\'t Be Empty' : null,
                              contentPadding: const EdgeInsets.all(15),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  'Branch',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black45,
                                  ),

                                ),
                              ),

                              DropdownButton(
                                value:  dropdownValue,
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 1,
                                  color: Colors.grey[200],
                                ),
                                onChanged: (String newValue){
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>['CSE','ME','AU','BT'].map<DropdownMenuItem<String>>((String value){
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  'Year',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                              DropdownButton(
                                value:  dropdownValueYear,
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 1,
                                  color: Colors.grey[200],
                                ),
                                onChanged: (String newValue){
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>['1st','2nd','3rd','4th'].map<DropdownMenuItem<String>>((String value){
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          TextField(
                            //controller: _text,
                            obscureText: true,
                            style: TextStyle(fontSize: 20 , color: Colors.black38),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: 'Password',
                          //    errorText: _validate ? 'Value Can\'t Be Empty' : null,
                              contentPadding: const EdgeInsets.all(15),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextField(
                            //controller: _text,
                            obscureText: true,
                            style: TextStyle(fontSize: 20 , color: Colors.black38),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: 'Confirm Password',
                             // errorText: _validate ? 'Value Can\'t Be Empty' : null,
                              contentPadding: const EdgeInsets.all(15),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          FlatButton(
                            child: Text('Sign Up',style: TextStyle(fontSize: 20),),
                            shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.all(15),
                            textColor: Colors.white70,
                            onPressed: null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );

        },
      )

    );
  }
}
