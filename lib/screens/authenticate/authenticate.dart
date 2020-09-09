import 'package:flutter/material.dart';
import 'package:beloxxi_app/screens/authenticate/signin.dart';
import 'package:beloxxi_app/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  //final Function getMappedItems;
  //Authenticate(this.getMappedItems);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  /*
  Map mappedItems;
  setItems(Map items) {
    setState(() {
          mappedItems= items;
        });
  }
  */
  bool showSignIn= true;
  void toggleView(){
    setState(
      () => showSignIn = !showSignIn
    );
  }
  
  @override
  Widget build(BuildContext context) {
    /*
    if(mappedItems != null){
      if(mappedItems.length>0){
        widget.getMappedItems(mappedItems);
      }
    }
    
    */

    if(showSignIn){
      return SignIn(toggleView);
      
    }else{
      //return Register(toggleView, setItems);
      return Register(toggleView);
    }
  }
}