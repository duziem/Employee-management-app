import 'package:flutter/material.dart';
import 'package:beloxxi_app/services/auth_service.dart';
/*
import 'package:beloxxi_app/screens/home/inherited_widget.dart';
import 'package:beloxxi_app/models/user.dart';
import 'package:beloxxi_app/models/employee_data.dart';
import 'package:beloxxi_app/models/employee_doc.dart';
import 'package:beloxxi_app/services/parse_employee_list.dart';
*/

class Register extends StatefulWidget {

  final Function toggleView;
  //final Function setItems;

  //Register(this.toggleView, this.setItems);
  Register(this.toggleView);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  String _error;
  String _email;
  String _password;
  String _name;
  String _serialno;
  //String _lockerno;
  //String _position;
  String _dateOfBirth;
  final _formkey= GlobalKey<FormState>();
  final AuthService _auth= AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar:AppBar(
        title:Text('Register'),
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
        actions:<Widget>[
          FlatButton.icon(
            icon:Icon(Icons.person,color: Colors.blue),
            label:Text('Signin',style: TextStyle(color: Colors.white)),
            onPressed:() {
              widget.toggleView();
            }
          ),
        ],
      ),
      body: 
          SingleChildScrollView(
             //reverse: true,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(30.0, 80.0, 30.0, 0.0),
                          child: 
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue,
                                    blurRadius: 25.0, // soften the shadow
                                    spreadRadius: 4.0, //extend the shadow
                                  )
                                ],
                              ),
                              
                              child: 
                                ClipOval(
                                      child: Image.asset('assets/images/bil0.jpg', fit: BoxFit.cover),    
                                ),
                              )
                        ),
                      Container(
                      padding: EdgeInsets.symmetric(vertical:20, horizontal:50),
                      //Registration Form
                      child: Form(
                       key:_formkey,
                      child: Column(
                      children: <Widget>[
                        SizedBox(height: 20,),
                        TextFormField(
                          validator:(val) => val.isEmpty? 'Enter Name': null,
                          onChanged: (val) {
                            setState(
                              () => _name= val
                            );
                          },
                          decoration: InputDecoration(
                                    hintText: 'Full name',
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

                        SizedBox(height: 20,),
                        TextFormField(
                          validator: (val) => val.isEmpty? 'Enter Sex': null,
                          decoration: InputDecoration(
                                    hintText: 'Sex',
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

                        SizedBox(height: 20,),
                        TextFormField(
                          validator:(val) => val.isEmpty? 'Enter Serial number': null,
                          onChanged: (val) {
                            setState(
                              () => _serialno= val
                            );
                          },
                          decoration: InputDecoration(
                                    hintText: 'Serial number',
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
                        /*
                        SizedBox(height: 20,),
                        TextFormField(
                          validator: (val) => val.isEmpty? 'Enter Position': null,
                          onChanged: (val) {
                            setState(
                              () => _position= val
                            );
                          },
                          decoration: InputDecoration(
                                    hintText: 'Job description',
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

                        SizedBox(height: 20,),
                        TextFormField(
                          validator: (val) => val.isEmpty? 'Enter Locker Number': null,
                          onChanged: (val) {
                            setState(
                              () => _lockerno= val
                            );
                          },
                          decoration: InputDecoration(
                                    hintText: 'Locker Number',
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
                        */
                        SizedBox(height: 20,),
                        TextFormField(
                          validator: (val) => val.isEmpty? 'EnterEmail': null,
                          onChanged: (val) {
                            setState(
                              () => _email= val
                            );
                          },
                          decoration: InputDecoration(
                                    hintText: 'Email',
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
                        SizedBox(height: 20,),
                        TextFormField(
                          validator:(val) => val.isEmpty? 'EnterPassword': null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(
                              () => _password= val
                            );
                          },
                          decoration: InputDecoration(
                                    hintText: 'Password - 6 chars long or more',
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
                        
                        SizedBox(height: 20,),
                        //This is the code for the Date of Birth TextFormField
                        TextFormField(
                          validator:(val) => val.isEmpty? 'Enter Date Of Birth': null,
                          onChanged: (val) {
                            setState(
                              () => _dateOfBirth= val
                            );
                          },
                          decoration: InputDecoration(
                                    hintText: 'Date Of Birth',
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

                        SizedBox(height: 20,),
                        //create a RaisedButton
                        //This button when clicked calls the function that authenticates user 
                        //and registers user's data to firebase
                        RaisedButton(
                          color:Colors.blue,
                          child:Text(
                            'Register',
                            style:TextStyle(color:Colors.white),
                          ),
                          onPressed:() async{
                            if(_formkey.currentState.validate()){
                              
                              //dynamic result= await _auth.registerUserWithEmailAndPassword(_email.trimRight(), _password, _name, _serialno, _position, _lockerno);
                              dynamic result= await 
                                _auth.registerUserWithEmailAndPassword(_email.trimRight(), _password, _name.trimRight(), _dateOfBirth.trimRight(), _serialno);
                              
                              if(result==null){
                                setState(
                                  ()=>_error= 'Please supply a valid Email'
                                  
                                );
                                return;
                              }
                              /*
                              widget.setItems({'nameText': _name, 'dateOfBirthText': _dateOfBirth, 'emailText': _email,
                                'passwordText': _password, 'serialnoText': _serialno, 'lockernoText': _lockerno, 'positionText': _position
                              });
                              */

                              /*
                              //pass the states as arguments into the inheritedWidget
                              InheritTextFromRegisterWidget(nameText: _name, dateOfBirthText: _dateOfBirth, emailText: _email,
                                passwordText: _password, serialnoText: _serialno, lockernoText: _lockerno, positionText: _position,
                              );
                              */
                            }
                            
                          },
                          
                        ),

                        SizedBox(height: 20,),
                        Text(_error!= null ? _error : '', style: TextStyle(color: Colors.red)),
                      ],
                ),
              ),
            ),
                    ],
                  ),
          ),
 
    );
  }
}


