import 'package:flutter/material.dart';
import 'package:beloxxi_app/services/auth_service.dart';
//import 'package:beloxxi_app/models/user.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn(this.toggleView);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  String error;
  String _email;
  String _password;
  final _formkey= GlobalKey<FormState>();
  final AuthService _auth= AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar:AppBar(
        title:Text('SIgn In'),
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
            icon:Icon(Icons.person,color: Colors.blue,),
            label:Text('Register',style: TextStyle(color: Colors.white)),
            onPressed:() {
              widget.toggleView();
            }
          ),
        ],
      ),
      body: SingleChildScrollView(
        //reverse: true,
        child: Column(
          children: <Widget>[ 
            Container(
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 60.0),
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
            child: Form(
              key:_formkey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
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
                    
                  SizedBox(height: 20.0,),
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
                  

                  SizedBox(height: 20.0,),
                  RaisedButton(
                    color:Colors.blue,
                    child:Text(
                      'Sign in',
                      style:TextStyle(color:Colors.white),
                    ),
                    onPressed:() async{
                      //User user= User(name: 'OCHIORA NNEKA ESTHER',dateOfBirth:'21/4/1995' );
                      //String name= user.name;
                      if(_formkey.currentState.validate()){
                        
                       // print('My Name Is $name');
                        dynamic result= await _auth.signInUserWithEmailAndPassword(_email.trimRight(), _password);
                        //dynamic result= await _auth.signInAnon();
                        if(result==null){
                          setState(
                            ()=>error= 'Please supply a valid Email'
                            
                          );
                        }
                        
                      }
                      
                    }
                  )
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