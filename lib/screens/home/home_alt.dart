import 'package:flutter/material.dart';
import 'package:beloxxi_app/services/auth_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';



final List imageList= ['assets/images/beloxxi1.jpg','assets/images/beloxxi2.jpg','assets/images/beloxxi3.jpg','assets/images/beloxxi4.jpg',
  'assets/images/beloxxi15.jpg','assets/images/beloxxi6.jpg','assets/images/beloxxi5.jpg','assets/images/beloxxi8.jpg','assets/images/beloxxi9.jpg',
  'assets/images/beloxxi13.jpg','assets/images/beloxxi14.jpg','assets/images/beloxxi2.jpg','assets/images/beloxxi6.jpg',
  'assets/images/beloxxi5.jpg','assets/images/beloxxi15.jpg','assets/images/beloxxi4.jpg','assets/images/beloxxi9.jpg','assets/images/beloxxi8.jpg'
];
class HomeAltScreen extends StatelessWidget {

  //this var is used to enable a user sign out
  final AuthService _auth= AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    ),

    body: Stack(
      children: <Widget>[
        Container(
          child: GridView.extent(
            maxCrossAxisExtent: 150.0,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            padding: const EdgeInsets.all(5.0),
            children: _buildGridTiles(imageList.length)
          ),
        ),

        Positioned(
          child: Container(
            
            /*constraints: BoxConstraints.expand(
              height: 150,
            ),*/
            /*
            decoration: BoxDecoration(
              color: Colors.black38,
            ),
            */
            child: Center(
              child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: Row(
                    children: <Widget>[
                      Text('BEL', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 40),),
                      Text('OXXI', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 40),),
                    ],
                  ),
                ),
                Row(
                    children: <Widget>[
                      Text('Industries', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30),),
                      Padding(padding: const EdgeInsets.only(left: 10),),
                      Text('Ltd', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 30),),
                    ],
                  ),
              ],
            ),
            )
             
          ),
          top: 200,
          bottom: 200,
          left: 90,
          //right: 150,
        ),

        Positioned(
          child: Container(
            /*
            decoration: BoxDecoration(
              color: Colors.black26,
            ),
            */
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
          //right: 150,
        )
      ],
    ),

    );

  }
}

    //create a _buildGridTiles Function

List<Widget> _buildGridTiles(numberOfTiles){
  
  List<Container> containers= List<Container>.generate(numberOfTiles, (int i){
    final imageName= imageList[i];
    
    return Container(
      child: Image.asset(imageName, fit: BoxFit.cover,),
    );
  });
  return containers;
}