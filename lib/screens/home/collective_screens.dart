import 'package:flutter/material.dart';
//import 'package:beloxxi_app/screens/home/income.dart';
import 'package:beloxxi_app/screens/home/income_buttons.dart';
import 'package:beloxxi_app/screens/home/profile.dart';
//import 'package:beloxxi_app/services/auth_service.dart';
//import 'package:provider/provider.dart';
//import 'package:beloxxi_app/models/user.dart';
import 'package:beloxxi_app/screens/home/image_gallery/gallery_wrapper.dart';
//import 'package:beloxxi_app/screens/home/home_alt.dart';
import 'package:beloxxi_app/screens/home/alternatives/home2.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex= 0;
  final List<Widget> _children= [HomeAltScreen(), IncomeScreen(), ProfileScreen(), GalleryWrapper()];
  void onTappedBar(int index){
    
    setState(
      () {_currentIndex= index;}
    );
  }
  /*
  @override
    void initState() {
      print(DbList().convertedlist[0]);
      super.initState();
    }
  */
  @override
  Widget build(BuildContext context) {
     return    
       Scaffold(
        body:_children[_currentIndex],

        //Style the Bottom Navigation Bar
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.white,
          backgroundColor: Colors.lightBlue,
          buttonBackgroundColor: Colors.white,
          height: 56.0,
          items: [
            Icon(Icons.home, color: Colors.blue),
            Icon(Icons.add_circle, color: Colors.blue),
            Icon(Icons.face, color: Colors.blue),
            Icon(Icons.image, color: Colors.blue),
          ],
          onTap: onTappedBar,
          animationCurve: Curves.bounceInOut,
          animationDuration: Duration(milliseconds: 200),
        )
/*
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedIconTheme: IconThemeData(size: 30.0),
          onTap: onTappedBar,
          type: BottomNavigationBarType.shifting,
          //type: BottomNavigationBarType.fixed,
          items:[
            BottomNavigationBarItem(
              icon:Icon(Icons.home, color: Colors.blue),
              title:Text('Home',style: TextStyle(color: Colors.blue),)
            ),

            BottomNavigationBarItem(
              icon:Icon(Icons.add_circle, color: Colors.blue),
              title:Text('Calculator',style: TextStyle(color: Colors.blue))
            ),
          
           BottomNavigationBarItem(
              icon:Icon(Icons.face, color: Colors.blue),
              title:Text('Profile',style: TextStyle(color: Colors.blue),)
            ),
           
            BottomNavigationBarItem(
              icon:Icon(Icons.image, color: Colors.blue),
              title:Text('Info',style: TextStyle(color: Colors.blue),)
            ),
            
          ],
        ),
        */
      );
    
  }
}