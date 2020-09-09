import 'package:flutter/material.dart';
//import 'package:beloxxi_app/services/auth_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeAltScreen extends StatelessWidget {

  //this var is used to enable a user sign out
  //final AuthService _auth= AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bil7.jpg'), fit: BoxFit.cover,)
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
        appBar: AppBar(
          title:Text('Home'),
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
        /*
        actions:<Widget>[
              FlatButton.icon(
                icon:Icon(Icons.person),
                label:Text('Sign out'),
                onPressed:() async{
                  //widget.toggleView();
                  await _auth.signOut();
                },
              ),
        ],
        */
      ),

      body: Stack(
        children: <Widget>[
          Positioned(
              child: Center(
                child:
                 Container(
                   width: 180,
                   height: 180,
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent,
                          blurRadius: 20.0, // soften the shadow
                          spreadRadius: 2.0, //extend the shadow
                          offset: Offset(
                            0.0, // Move to right 10  horizontally
                            0.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                   ),
                   child: 
                    ClipOval(
                          child: Image.asset('assets/images/bil5.jpg', fit: BoxFit.cover),    
                    ),
                 )
              ),   
            top: 80,
            //bottom: 200,
            left: 60,
            right: 60,
          ),

          Positioned(
            child: Container(
              
              /*constraints: BoxConstraints.expand(
                height: 150,
              ),*/
              child: Center(
                child:
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Row(
                      children: <Widget>[
                        //BELOXXI Container row
                        childOfBelRow('B'),
                        childOfBelRow('E'),
                        childOfBelRow('L'),
                        childOfOxxiRow('O'),
                        childOfOxxiRow('X'),
                        childOfOxxiRow('X'),
                        childOfOxxiRow('I'),
                      ],
                    ),
                  ),
              )
               
            ),
            top: 200,
            bottom: 200,
            left: 70,
          ),

          Positioned(
            child: Container(
              child: Row(
                     // mainAxisAlignment: MainAxisAlignment.center,
                     // mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding:EdgeInsets.only(left:5,right:5),
                          
                            child:IconButton(
                              icon:Icon(FontAwesomeIcons.facebook),
                              onPressed:() {
                                launch('https://web.facebook.com/BeloxxiNigeria/?_rdc=1&_rdr');
                              },
                              iconSize: 40,
                              color: Colors.blue,
                            )
                          
                        ),
                        Padding(
                          padding:EdgeInsets.only(left:5,right:5),
                          child:IconButton(
                            icon:Icon(FontAwesomeIcons.twitter),
                            onPressed:() {launch('https://twitter.com/beloxxinigeria?lang=en');
                            },
                            iconSize: 50,
                            color: Colors.blue,
                          )
                        ),
                        Padding(
                          padding:EdgeInsets.only(left:5,right:5),
                          child:IconButton(
                            icon:Icon(FontAwesomeIcons.instagram),
                            onPressed:() {launch('https://www.instagram.com/beloxxinigeria/?hl=en');},
                            iconSize: 50,
                            color: Colors.blue,
                          )
                        ),
                        
                      ],
                    ),
            ),
            bottom: 100,
            left: 100,
          )
        ],
      ),

      ),
    );

  }
}

Widget childOfBelRow(String letter){
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blue,
      boxShadow: [
       // color: Colors.white, //background color of box
        BoxShadow(
          color: Colors.blue,
          blurRadius: 20.0, // soften the shadow
          spreadRadius: 2.0, //extend the shadow
          offset: Offset(
            5.0, // Move to right 10  horizontally
            5.0, // Move to bottom 10 Vertically
          ),
        )
      ],
    ),
    child: Center(
       child: Text(letter, textAlign: TextAlign.center, 
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white)),
    ),
  );
}
Widget childOfOxxiRow(String letter){
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        //stops: [0.3,0.8],
        colors: [Colors.red, Colors.blue]
      ),
      boxShadow: [
        //color: Colors.white, //background color of box
        BoxShadow(
          color: Colors.red,
          blurRadius: 20.0, // soften the shadow
          spreadRadius: 2.0, //extend the shadow
          offset: Offset(
            5.0, // Move to right 10  horizontally
            5.0, // Move to bottom 10 Vertically
          ),
        )
      ],
    ),
    child: Center(
      child: Text(letter, textAlign: TextAlign.center, 
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white)),
    ),
  );
}