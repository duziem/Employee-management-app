import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:beloxxi_app/screens/home/passport/passport_logic.dart';
//import 'package:flutter/services.dart';

class EmployeePassport extends StatelessWidget {
  final DocumentSnapshot employeeDocument;
  EmployeePassport(this.employeeDocument);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      width: double.infinity,
      height: 200.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1,0.5,0.8,1.0],
          colors: [Colors.redAccent, Colors.blue, Colors.yellow, Colors.blueGrey]
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[

          /*
          * Employee Passport Column
          */
            Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  //Employee Passport Container:renders the employee passport shown at the top of the profile screen 
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
                    width: 140.0,
                    height: 140.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white70,
                      
                      image: DecorationImage(
                        image: employeeDocument['PASSPORT LOCATION']!= null ? 
                          NetworkImage(employeeDocument['PASSPORT LOCATION'],) : null,
                        fit: BoxFit.cover
                      ),
                      
                     border: Border.all(color: Colors.blue, width: 0.8 ), 
                    ),
                    /*
                    child: ClipOval(
                        child: employeeDocument['PASSPORT LOCATION'] == null ? 
                      null : Image.network(employeeDocument['PASSPORT LOCATION'], fit: BoxFit.cover,),    
                    ),
                    */
                  ),
                  Positioned(
                    child: GestureDetector(
                      child: Icon(Icons.add_a_photo, size: 36.0, color: Colors.white,),
                      onTap: () {
                        imageCache.clear();
                        getImage(context, employeeDocument);
                      },
                    ),
                    bottom: 10,
                    right: 4,
                  )
                  
                ],
              ),

              // Employee Name
              Center(child: Text(employeeDocument['NAME'], 
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white)),
              ),
            ],
          ),
          // End of Passport column

      //the section below Details column is something i was working on. It was meant to be displayed at the right hand side of the employee image shown in the profile screen 
        /*
          //Details column
              Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              //designation
              Container(
                margin: EdgeInsets.only(top: 5.0,),
                width: MediaQuery.of(context).size.width / 4,
                 //width: 100.0,
                height: 34.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white54,
                  border: Border.all(color: Colors.blue, width: 0.8 ),
                  borderRadius: BorderRadius.all(Radius.circular(12.0))
                ),
                child: Center(child: Text(employeeDocument['DESIGNATION'],textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white)),)//designation
              ),

              //sex
              Container(
                margin: EdgeInsets.only(top: 5.0, left: 20.0),
                width: MediaQuery.of(context).size.width / 5,
                //width: 80.0,
                height: 26.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white70,
                  border: Border.all(color: Colors.blue, width: 0.8 ),
                  borderRadius: BorderRadius.all(Radius.circular(12.0))
                ),
                child: Center(child: Text(employeeDocument['SEX'],textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white)),),//sex
              ),
          
            ],
          )
          //End of details column
          */
        ],
      ),
    );
  }
}
/*
Column passportColumn= 
            Column(

            children: <Widget>[
              //passportcontainer
              Container(
                width: 80.0,
                height: 120.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 5.0,),
              //name
              Container(
                width: 160.0,
                //height: 30.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white54,
                  border: Border.all(color: Colors.blueGrey, width: 6.0 )
                ),
                child: Text('Nnaemezie Francis Okeke'),
              )
              
            ],
          );

Column detailsColumn= 
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //sex
              Container(
                width: 100.0,
                height: 30.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white54,
                  border: Border.all(color: Colors.blueGrey, width: 12.0 )
                ),
                child: Text('Male'),//sex
              ),
              //SizedBox(height: 20.0,),
              //Email
              Container(
                 width: 100.0,
                height: 30.0,
                
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white54,
                  border: Border.all(color: Colors.blueGrey, width: 3.0 )
                ),
                child: Text('frenzy@gmail.com'),//Email
              ),
              //SizedBox(height: 30.0,),
              //designation
              Container(
                 width: 100.0,
                height: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white54,
                  border: Border.all(color: Colors.blueGrey, width: 3.0 )
                ),
                child: Text('Proffessor'),//designation
              ),
            ],
          );
*/
