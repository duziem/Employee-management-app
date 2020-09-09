import 'package:flutter/material.dart';


class IncomeScreen extends StatefulWidget {
  
  @override
  _IncomeScreenState createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {

  final textFieldController1= TextEditingController();
  final textFieldController2= TextEditingController();
  final textFieldController3= TextEditingController();

  void clearFields(){
    textFieldController1.clear();
    textFieldController2.clear();
    textFieldController3.clear();

    setState(
      () {

       _morningWeekFee= 0;_adfternoonWeekFee= 0;_nightWeekFee= 0;_sum= 0;
        }
    );
  }
  void sumTheFees(){
    setState(
      () {
       _sum= _morningWeekFee + _adfternoonWeekFee + _nightWeekFee;
        }
    );
    
  }
  
  int dayFee2019= 900;
  int nightFee2019= 1050;
  int _morningWeekFee= 0;
  int _adfternoonWeekFee= 0;
  int _nightWeekFee= 0;
  int _radioBtn= 2018;
  int _sum= 0;
  int dayFee;
  int nightFee;

  @override
  Widget build(BuildContext context) {
    if(_radioBtn == 2018){
      dayFee = 800;
      nightFee= 950;
    }else if(_radioBtn == 2019) {
      dayFee = 900;
      nightFee= 1050;
    }

    return Scaffold(
      appBar:AppBar(
        title:Text('IncomeScreen'),
        flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Colors.red,
                  Colors.blue
                ],
              ),
            ),
      ),
      ),

      body: Container(
        padding: const EdgeInsets.only(top: 10.0, left: 20.0),
        child: 
              Stack(
                      children: <Widget>[

                        //create the 2018 and 2019 radio buttons
                        Positioned(
                          child:Row(
                            children: <Widget>[
                              Row(
                            children: <Widget>[
                               Radio(
                                value: 2018,
                                groupValue: _radioBtn,
                                onChanged: (val) {
                                  setState(
                                    () {
                                      _radioBtn= val;
                                    }
                                  ); 
                                },
                          
                                ),
                                Padding(padding: const EdgeInsets.only(left: 5),),
                                Text('2018 or <2018')
                            ],
                          ),
                          
                          //Create a padding btw the two radio buttons
                          Padding(padding: const EdgeInsets.only(left: 10),),

                          Row(
                            children: <Widget>[
                               Radio(
                                value: 2019,
                                groupValue: _radioBtn,
                                onChanged: (val) {
                                  setState(
                                    () {
                                      _radioBtn= val;
                                    }
                                  ); 
                                },
                          
                                ),
                                Padding(padding: const EdgeInsets.only(left: 5),),
                                Text('2019 or >2019')
                            ],
                          ),

                            ],
                          ),
                          top: 0,
                          left: 0,
                        ),
                          
                        //The area below is for the Text form fields and the values displayed at the right of each field  
                        Positioned(
                          child: 
                           TextFormField(
                          controller:textFieldController1,
                         onChanged: (val) {
                            setState(
                              () {
                                _morningWeekFee= int.parse(val) * dayFee;
                              }
                            ); 
                          },
                          decoration: InputDecoration(
                            hintText: 'Number of mornings worked',
                            fillColor: Colors.white,
                            filled:true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2.0)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue, width: 2.0)
                            ),
                          ),
                        ),
                          top: 50,
                          left: 0,
                          height: 50,
                          width: 280
                        ),
                        Positioned(
                          child: Text(_morningWeekFee.toString()),
                          top: 66,
                          right: 0,
                          height: 30,
                          width: 60
                        ),

                        //second column of text form field and it's display text
                         Positioned(
                          child: 
                           TextFormField(
                          controller:textFieldController2,
                         onChanged: (val) {
                            setState(
                              () {
                                _adfternoonWeekFee= int.parse(val) * dayFee;
                              }
                            ); 
                          },
                          decoration: InputDecoration(
                            hintText: 'Number of adfternoons worked',
                            fillColor: Colors.white,
                            filled:true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2.0)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue, width: 2.0)
                            ),
                          ),
                        ),
                          top: 110,
                          left: 0,
                          height: 50,
                          width: 280
                        ),
                        Positioned(
                          child: Text(_adfternoonWeekFee.toString()),
                          top: 126,
                          right: 0,
                          height: 30,
                          width: 60
                        ),

                        //third column of text form field and it's display text
                         Positioned(
                          child: 
                           TextFormField(
                          controller:textFieldController3,
                         onChanged: (val) {
                            setState(
                              () {
                                _nightWeekFee= int.parse(val) * nightFee;
                              }
                            ); 
                          },
                          decoration: InputDecoration(
                            hintText: 'Number of nights worked',
                            fillColor: Colors.white,
                            filled:true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2.0)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue, width: 2.0)
                            ),
                          ),
                        ),
                          top: 170,
                          left: 0,
                          height: 50,
                          width: 280
                        ),
                        Positioned(
                          child: Text(_nightWeekFee.toString()),
                          top: 186,
                          right: 0,
                          height: 30,
                          width: 60
                        ),

                      //Sum Button, Reset button and summed income
                         Positioned(
                          child: 
                          RaisedButton(
                            color: Theme.of(context).primaryColor,
                        child:Text('Sum'),
                        onPressed:sumTheFees,
                      ),
                          top: 250,
                          left: 0,
                          height: 30,
                          width: 80
                        ),

                         Positioned(
                          child: 
                          RaisedButton(
                            color: Theme.of(context).primaryColor,
                        child:Text('Reset'),
                        onPressed:clearFields,
                      ),
                          top: 250,
                          left: 100,
                          height: 30,
                          width: 80
                        ),

                        Positioned(
                          child: Text(_sum.toString()),
                          top: 260,
                          right: 0,
                          height: 30,
                          width: 60
                        ),
                      ],
            ),
      ),
    );
  }
}