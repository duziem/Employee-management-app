import 'package:flutter/material.dart';
import 'package:beloxxi_app/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:beloxxi_app/models/user.dart';
import 'package:beloxxi_app/screens/home/collective_screens.dart';
import 'package:beloxxi_app/models/employee_data.dart';
import 'package:beloxxi_app/models/employee_doc.dart';
import 'package:beloxxi_app/screens/home/inherited_widget.dart';



class Wrapper extends StatelessWidget {
  final User user;
  Wrapper(this.user);//set the global variable user declared above to the argument assigned to the user parameter of this wrapper widget at the point where this widget is inserted

  @override
  Widget build(BuildContext context) {
    /*
    final User user= Provider.of<User>(context);
    final EmployeeData employeeData= user== null ? null : Provider.of<EmployeeData>(context);//This variable holds the EmployeeData model : The EmployeeData model contains the data of the user such as: name, date of birth,etc obtained from Beloxxi_data collection
    final List<EmployeeDoc> employeeList= Provider.of<List<EmployeeDoc>>(context);//This variable holds the list of user documents from the employee_list collection
  */
  
    if(user == null){
      return Authenticate();
    }else{ 
      final EmployeeData employeeData= Provider.of<EmployeeData>(context);//This variable holds the EmployeeData model : The EmployeeData model contains the data of the user such as: name, date of birth,etc obtained from Beloxxi_data collection
      final List<EmployeeDoc> employeeList= Provider.of<List<EmployeeDoc>>(context);//This variable holds the list of user documents from the employee_list collection
      
      /*
        Initially when this is run, the user stream it depends on returns null, 
        hence it is enclosed in a try/catch block to catch the error/exception thrown when this happens
      */
      try{
        return InheritWidget(name: employeeData.name, 
        dob: employeeData.dateOfBirth,
        employeeData: employeeData,
        employeeList: employeeList,
        user: user,
        child: Builder(builder: (context) {
          return Home();
          },
        ),
        );
      }catch(e){return LinearProgressIndicator();}
      
      //Note to self: if the try and catch code above doesn't work you can try wrapping the InheritWidget in a conditional that 
      //checks if employeeData == null
      //I think the problem is bcos when the snapshot call is initially loaded, there is no snapshot data, that is,
      //snapshot returns null initially 
    }
    
  
  }
}

/*
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user= Provider.of<User>(context);
    Map myItems;
    void getMappedItems(Map mappedItems) {
      myItems= mappedItems;
    }

    //return either Home or Authenticate Page
    if(user == null){
      return Authenticate(getMappedItems);
    }else{
      return Home();
      //return ShowList();
    }
  }
}
*/

/*
class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  Map myItems={};
    void getMappedItems(Map mappedItems) {
      setState(() {
          myItems= mappedItems;    
      }); 
    }
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<User>(context);
    if(myItems != null){
      if(myItems.length > 0) {
        //call the inherited widget here and assign the mapped items to it
        InheritTextFromRegisterWidget(nameText: myItems['nameText'], dateOfBirthText: myItems['dateOfBirthText'], emailText: myItems['emailText'],
          passwordText: myItems['passwordText'], serialnoText: myItems['serialnoText'], lockernoText: myItems['lockernoText'], positionText: myItems['positionText'],
        );
    }
    }
     
    //return either Home or Authenticate Page
    if(user == null){
      return Authenticate(getMappedItems);
    }else{
      return Home();
    }
  }

}
*/

