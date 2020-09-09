import 'package:flutter/material.dart';


class IncomeScreen2018 extends StatefulWidget {
  
  @override
  _IncomeScreen2018State createState() => _IncomeScreen2018State();
}

class _IncomeScreen2018State extends State<IncomeScreen2018> {

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
  
  int _morningWeekFee= 0;
  int _adfternoonWeekFee= 0;
  int _nightWeekFee= 0;
  //int _radioBtn= 2018;
  int _sum= 0;
  int dayFee;
  int nightFee;
  final List<String> banks= ['GT BANK', 'STANBIC BANK'];
  String _bankValue= 'GT BANK';
  int tax= 50;

  @override
  Widget build(BuildContext context) {

  if(_bankValue == 'GT BANK'){
    dayFee = 900 - tax;
    nightFee = 1050 - tax;
  }else if(_bankValue == 'STANBIC BANK'){
    dayFee= 900;
    nightFee= 1050;
  }
    return Scaffold(
      appBar:AppBar(
        title:Text('2018'),
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

                    //Dropdown Field //Dropdown Field  //Dropdown Field 
                      Positioned(
                        child: DropdownButton(
                          value: _bankValue,
                          items: banks.map((bank){
                            return DropdownMenuItem(
                              value: bank,
                              child: Text('$bank'),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              _bankValue = val;                          
                            });
                          },
                        ), 
                        top: 0,
                        left: 0,
                      ),
                      //Dropdown Field //Dropdown Field  //Dropdown Field 

                      //The area below is for the Text  fields and the values displayed at the right of each field  
                        Positioned(
                          child: 
                           TextField(
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

                        //second column of text  field and it's display text
                         Positioned(
                          child: 
                           TextField(
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

                        //third column of text  field and it's display text
                         Positioned(
                          child: 
                           TextField(
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