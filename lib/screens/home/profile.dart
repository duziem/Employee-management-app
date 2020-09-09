import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:provider/provider.dart';
import 'package:beloxxi_app/screens/home/inherited_widget.dart';
//import 'package:beloxxi_app/models/image.dart';
import 'package:beloxxi_app/models/user.dart';
//import 'package:beloxxi_app/models/employee_data.dart';
//import 'package:beloxxi_app/models/employee_doc.dart';
import 'package:beloxxi_app/services/parse_employee_list.dart';
import 'package:beloxxi_app/screens/home/passport/passport_ui.dart';
import 'package:beloxxi_app/services/auth_service.dart';
import 'package:beloxxi_app/services/database.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 
  final AuthService _auth= AuthService(); //this AuthService object is imported in the profile object so as to enable a user sign out
  final _formkey= GlobalKey<FormState>();
  String _name;
  String _address;
  int _telephone1;
  int _telephone2;
  String _designation;
  @override
  Widget build(BuildContext context) {
    final User user= InheritWidget.of(context).user;

    return 
     StreamBuilder(
      // initialData: , *Read more on this StreamBuilder parameter initialData
      stream: Firestore.instance.collection('beloxxi_data').document(user.uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (!snapshot.hasData) {
          return new LinearProgressIndicator();
        }
        else{
              DocumentSnapshot userDocument = snapshot.data;
              return new Scaffold(
                appBar: AppBar(
                  title:Text('Profile'),
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
                      label:Text('Sign out',style: TextStyle(color: Colors.white),),
                      onPressed:() async{
                        await _auth.signOut();
                      },
                    ),
                    FlatButton.icon(
                      icon:Icon(Icons.edit,color: Colors.blue,),
                      label:Text('Edit',style: TextStyle(color: Colors.white)),
                      onPressed:() async{
                        showModalBottomSheet(context: context, builder: (context){
                          return _updateEmployeeProfile(userDocument, context, user);
                        });
                      },
                    ),
                  ],
                ),

                body:
                /* Note: the conditional below was a sort of experiment where we check the database to know if the user already exists in the beloxxi database
                *  if the user exists that is, the userDocument['SEX'] (any other field name could have been used e.g userDocument['ADDRESS'] so long as it does not yet exist in the beloxxi database) does not return null, the conditional returns true and the subsequent code is run
                *  else if the conditional returns false ParseEmployeeList class contained in the parse_employee_list.dart file located in the services folder is executed
                *  which migrates some data from the employee database to beloxxi database
                */
                  userDocument['SEX'] != null ?
                        Column(
                            children: <Widget>[
                              EmployeePassport(userDocument),//Employee passport widget: located in the passport_ui.dart page
                              Expanded(
                                //ListView displaying Employee Data
                                child: ListView( 
                                children: <Widget>[

                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                      child: Card(
                                        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                                        child: ListTile(
                                          leading: Icon(Icons.person, color: Colors.blue,),
                                  
                                          title: Text('Name'),
                                          subtitle: Text(userDocument['NAME']),
                                        )
                                      )
                                    ),
                                     Padding(
                                    padding: EdgeInsets.only(top: 8),
                                      child: Card(
                                        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                                        child: ListTile(
                                          leading: Icon(Icons.person, color: Colors.blue,),
                                  
                                          title: Text('Sex'),
                                          subtitle: Text(userDocument['SEX']),
                                        )
                                      )
                                    ),
                                    Padding(
                                    padding: EdgeInsets.only(top: 8),
                                      child: Card(
                                        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                                        child: ListTile(
                                          leading: Icon(Icons.calendar_today, color: Colors.blue,),
                                  
                                          title: Text('Date of Birth'),
                                          subtitle: Text(userDocument['DATE OF BIRTH']),
                                        )
                                      )
                                    ),
                                     Padding(
                                    padding: EdgeInsets.only(top: 8),
                                      child: Card(
                                        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                                        child: ListTile(
                                          leading: Icon(Icons.person, color: Colors.blue,),
                                  
                                          title: Text('State of Origin'),
                                          subtitle: Text(userDocument['STATE OF ORIGIN']),
                                        )
                                      )
                                    ),
                                    Padding(
                                    padding: EdgeInsets.only(top: 8),
                                      child: Card(
                                        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                                        child: ListTile(
                                          leading: Icon(Icons.card_travel, color: Colors.blue,),
                                  
                                          title: Text('Designation'),
                                          subtitle: Text(userDocument['DESIGNATION']),
                                        )
                                      )
                                    ),
                                     Padding(
                                    padding: EdgeInsets.only(top: 8),
                                      child: Card(
                                        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                                        child: ListTile(
                                          leading: Icon(Icons.calendar_today, color: Colors.blue,),
                                  
                                          title: Text('Date of Entry'),
                                          subtitle: Text(userDocument['DATE OF ENTRY']),
                                        )
                                      )
                                    ),
                                     Padding(
                                    padding: EdgeInsets.only(top: 8),
                                      child: Card(
                                        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                                        child: ListTile(
                                          leading: Icon(Icons.home, color: Colors.blue,),
                                  
                                          title: Text('Address'),
                                          subtitle: Text(userDocument['ADDRESS']),
                                        )
                                      )
                                    ),
                                     Padding(
                                    padding: EdgeInsets.only(top: 8),
                                      child: Card(
                                        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                                        child: ListTile(
                                          leading: Icon(Icons.home, color: Colors.blue,),
                                  
                                          title: Text('POC Address'),
                                          subtitle: Text(userDocument['POC ADDRESS']),
                                        )
                                      )
                                    ),
                                     Padding(
                                    padding: EdgeInsets.only(top: 8),
                                      child: Card(
                                        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                                        child: ListTile(
                                          leading: Icon(Icons.home, color: Colors.blue,),
                                  
                                          title: Text('NOK Address'),
                                          subtitle: Text(userDocument['NOK ADDRESS']),
                                        )
                                      )
                                    ),
                                    Padding(
                                    padding: EdgeInsets.only(top: 8),
                                      child: Card(
                                        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                                        child: ListTile(
                                          leading: Icon(Icons.phone, color: Colors.blue,),
                                  
                                          title: Text('Phone 1'),
                                          subtitle: Text(userDocument['TELEPHONE 1'].toString()),
                                        )
                                      )
                                    ),
                                     Padding(
                                    padding: EdgeInsets.only(top: 8),
                                      child: Card(
                                        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                                        child: ListTile(
                                          leading: Icon(Icons.phone, color: Colors.blue,),
                                  
                                          title: Text('Phone 2'),
                                          subtitle: Text(userDocument['TELEPHONE 2'].toString()),
                                        )
                                      )
                                    ),
                                     Padding(
                                    padding: EdgeInsets.only(top: 8),
                                      child: Card(
                                        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                                        child: ListTile(
                                          leading: Icon(Icons.person, color: Colors.blue,),
                                  
                                          title: Text('Referals'),
                                          subtitle: Text(userDocument['REFERALS']),
                                        )
                                      )
                                    ),

                                ] ,
                                ),
                              )
                            ],
                          )
            : ParseEmployeeList(userDocument)
                                

      );
    }

  }
     );   
  }
  
  //Update Employee profile section: contained in the showModalBottomSheet
  _updateEmployeeProfile(DocumentSnapshot userDocument,BuildContext context, User user) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          //reverse: true,
          child: Column(
            children: <Widget>[
              Padding(padding: const EdgeInsets.only(top: 10.0),),
              Text('Update your Profile'),
              SizedBox(height: 20.0,),
              Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
        child: Form(
          key:_formkey,
          child: Column(
            children: <Widget>[
              //Name Text input
              TextFormField(
                initialValue: userDocument['NAME'].toString(),
                //validator: (val) => val.isEmpty? 'Enter Name': null,
                onChanged: (val) {
                  val.isNotEmpty ?
                  setState(
                    () => _name= val
                  ) : setState(
                    () => _name= userDocument['NAME']
                  );
                },
                decoration: InputDecoration(
                          hintText: 'Name',
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
              //ADDRESS Text input
              TextFormField(
                initialValue: userDocument['ADDRESS'].toString(),
               // validator: (val) => val.isEmpty? 'Enter Address': null,
                onChanged: (val) {
                  val.isNotEmpty ?
                  setState(
                    () => _address= val
                  ) : setState(
                    () => _address= userDocument['ADDRESS']
                    //() => _address=  ''
                  );
                },
                decoration: InputDecoration(
                          hintText: 'Address',
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
              //Designation Text input
              TextFormField(
                initialValue: userDocument['DESIGNATION'].toString(),
                //validator: (val) => val.isEmpty? 'Enter Designation': null,
                onChanged: (val) {
                  val.isNotEmpty ?
                  setState(
                    () => _designation= val
                  ) : setState(
                    () => _designation= userDocument['DESIGNATION']
                  );
                },
                decoration: InputDecoration(
                          hintText: 'Designation',
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
              //Telephone 1 Text input
              TextFormField(
                initialValue: userDocument['TELEPHONE 1'].toString(),
                //validator: (val) => val.isEmpty? 'Enter Phone number': null,
                onChanged: (val) {
                  val.isNotEmpty ?
                  setState(
                    () => _telephone1= int.parse(val)
                  ) : setState(
                    () => _telephone1= userDocument['TELEPHONE 1']
                  );
                },
                decoration: InputDecoration(
                          hintText: 'Telephone 1',
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
              //Telephone 2 Text input
              TextFormField(
                initialValue: userDocument['TELEPHONE 2'].toString(),
                //validator: (val) => val.isEmpty? 'Enter Phone number': null,
               onChanged: (val) {
                  val.isNotEmpty ?
                  setState(
                    () => _telephone2= int.parse(val)
                  ) : setState(
                    () => _telephone2= userDocument['TELEPHONE 2']
                  );
                },
                decoration: InputDecoration(
                          hintText: 'Telephone 2',
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
                  'Update',
                  style:TextStyle(color:Colors.white),
                ),
                onPressed:() async{
                  if(_formkey.currentState.validate()){
                    //print('My telephone number is: $_telephone1');
                    //updating dialog box
                    showDialog(context: context, builder: (BuildContext context){
                      return SimpleDialog(
                        children: <Widget>[
                          new CircularProgressIndicator(),
                          new Text('Updating'),
                        ],
                      );
                    });
                    await DatabaseService(uid: user.uid).updateEmployeeData(
                      userDocument, name: _name, address: _address, designation: _designation, 
                      telephone1: _telephone1, 
                      telephone2: _telephone2
                    );
                    setState(() {});

                    //show a simpledialog with info: finished updating after the employee profile update function
                    //has been executed
                    Navigator.pop(context);
                    showDialog(context: context, builder: (BuildContext context){
                      return SimpleDialog(
                        children: <Widget>[
                          new CircularProgressIndicator(),
                          new Text('Finished Updating'),
                        ],
                      );
                    });

                    Future.delayed(const Duration(seconds: 3), () {
                      Navigator.pop(context);
                    });
                  }
                  
                }
              )
            ],
          ),
        ),
      )
            ],
          ),
        ),
      );

  }
  // ENd of Update Employee profile section
}
