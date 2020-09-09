import 'package:flutter/material.dart';
import 'package:beloxxi_app/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:beloxxi_app/services/auth_service.dart';
import 'package:beloxxi_app/models/user.dart';
import 'style.dart';
import 'package:beloxxi_app/services/database.dart';
import 'package:beloxxi_app/models/employee_data.dart';
import 'package:beloxxi_app/models/employee_doc.dart';
//import 'package:beloxxi_app/screens/home/collective_screens.dart';
//import 'package:beloxxi_app/screens/home/showdb.dart';


void main() {
  runApp(MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>.value(
      value: AuthService().user,
      child: Builder(builder: (context){

        final User user= Provider.of<User>(context);
        String _isUser;
        if(user != null){
           _isUser = user.uid;
        }

        return MultiProvider(
        providers: [
          StreamProvider<EmployeeData>.value(value: DatabaseService(uid: _isUser).beloxxiEmployeeData),
          StreamProvider<List<EmployeeDoc>>.value(value: DatabaseService().employeelist),
        ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,//remove the debug label at the top-right corner
            home: Wrapper(user),
            //home: ShowList(),
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                textTheme: TextTheme(headline6: AppBarTextStyle),
              ),
              textTheme: TextTheme(
                headline6: TitleTextStyle,
                bodyText2: Body1TextStyle
              ),
              primarySwatch: Colors.blue,
            ),
          )
      );
      },
      ),
    );
    
  }
}
/*
class MyApp extends StatelessWidget {
  // This widget is the root of your+ application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(value: AuthService().user),
        //StreamProvider<EmployeeData>.value(value: DatabaseService(uid: AuthService().userId.toString()).beloxxiEmployeeData),
        StreamProvider<List<EmployeeDoc>>.value(value: DatabaseService().employeelist),
      ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
         home: Wrapper(),
          //home: ShowList(),
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              textTheme: TextTheme(headline6: AppBarTextStyle),
            ),
            textTheme: TextTheme(
              headline6: TitleTextStyle,
              bodyText2: Body1TextStyle
            ),
            primarySwatch: Colors.blue,
          ),
        )
    );
  }
}
*/

//class MyApp extends StatelessWidget {
  // This widget is the root of your application.
 // @override
 // Widget build(BuildContext context) {
    //return StreamProvider<User>.value(
       // value: AuthService().user,
       // child: MaterialApp(
   //      return MaterialApp(
     //     home: Home(),
   //      );
        //),
    //);
 // }
//}