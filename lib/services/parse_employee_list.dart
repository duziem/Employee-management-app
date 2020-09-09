import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:beloxxi_app/models/user.dart';
import 'package:beloxxi_app/models/employee_data.dart';
import 'package:beloxxi_app/models/employee_doc.dart';
import 'package:flutter/material.dart';
import 'package:beloxxi_app/screens/home/inherited_widget.dart';
import 'package:beloxxi_app/screens/home/passport/passport_ui.dart';


final CollectionReference beloxxiData= Firestore.instance.collection('beloxxi_data');

class ParseEmployeeList extends StatelessWidget {

  final DocumentSnapshot userDocument;
  ParseEmployeeList(this.userDocument);
  @override
  Widget build(BuildContext context) {
    final User user= InheritWidget.of(context).user;
    final EmployeeData employeeData= InheritWidget.of(context).employeeData;
    final List<EmployeeDoc> employeeList= InheritWidget.of(context).employeeList;

    return FutureBuilder(
         future:  _moveThenDeleteEmployee(user,employeeData,employeeList),
         builder: (context, futureData) {
           return LinearProgressIndicator();
         },
     );
  }
    EmployeeDoc _getEmployeeDoc(employeeData,employeeList) {
    for (var employee in employeeList) {
      if(employee.employeeDoc['NAME'] == employeeData.name && employee.employeeDoc['DATE OF BIRTH'] == employeeData.dateOfBirth) {
        return employee;
      }
    }
  }
  
  //move the employee document returned from the getEmployeeDoc function above into Beloxxi_data collection 
  //and then delete the document from employee_list
  Future _moveThenDeleteEmployee(user,employeeData,employeeList) async {
    Map<String, dynamic> employee= _getEmployeeDoc(employeeData,employeeList).employeeDoc;
    print('Buffer');
    print(user.uid);
    
    //var name= employee['NAME'];
    //var dateOfBirth= employee['DATE OF BIRTH'];
    var sex= (employee['SEX'].toString()).trim();//test this code by registering a new employee
    var state= (employee['STATE OF ORIGIN'].toString()).trim();//test this code by registering a new employee
    var addresss= employee['ADDRESS'];
    var telephone1= employee['TELEPHONE 1'];
    var telephone2= employee['TELEPHONE 2'];
    var pocAddress= employee['POC ADDRESS'];
    var nokAddress= employee['NOK ADDRESS'];
    var referals= employee['REFERALS'];
    var designation= employee['DESIGNATION'];
    var dateOfEntry= employee['DATE OF ENTRY'];
    var month= employee['MONTH'];

    //reset the beloxxi_data collection
    await beloxxiData.document(user.uid).setData({
      /*'EMAIL': employeeData.email,
      'PASSWORD': employeeData.password,
      'NAME': name ?? 'N/A',
      'DATE OF BIRTH': dateOfBirth ?? 'N/A',*/
      'SEX': sex ?? 'N/A',
      'STATE OF ORIGIN': state ?? 'N/A',
      'ADDRESS': addresss ?? 'N/A',
      'TELEPHONE 1': telephone1 ?? 'N/A',
      'POC ADDRESS': pocAddress ?? 'N/A',
      'NOK ADDRESS': nokAddress ?? 'N/A',
      'TELEPHONE 2': telephone2 ?? 'N/A',
      'REFERALS': referals ?? 'N/A',
      'DESIGNATION': designation ?? 'N/A',
      'DATE OF ENTRY': dateOfEntry ?? 'N/A',
      'MONTH': month ?? 'N/A',
  }, merge: true);

  }
}


/*
class ParseEmployeeList extends StatefulWidget {
  final Function setIsMovedEmployee;
  
  final DocumentSnapshot userDoc;
  ParseEmployeeList(this.userDoc, this.setIsMovedEmployee);
  //ParseEmployeeList(this.setIsMovedEmployee);
  @override
  _ParseEmployeeListState createState() => _ParseEmployeeListState();
}

class _ParseEmployeeListState extends State<ParseEmployeeList> {


  @override
  Widget build(BuildContext context) {
    final User user= InheritWidget.of(context).user;
    final EmployeeData employeeData= InheritWidget.of(context).employeeData;
    final List<EmployeeDoc> employeeList= InheritWidget.of(context).employeeList;
    
       
       return FutureBuilder(
         future:  moveThenDeleteEmployee(user,employeeData,employeeList),
         builder: (context, futureData) {
           return LinearProgressIndicator(); 
           /*ListView(
         children: <Widget>[
           Padding(
            padding: EdgeInsets.only(top: 8),
              child: Card(
                margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                child: ListTile(
                  leading: Icon(Icons.person, color: Colors.blue,),
          
                  title: Text('Name'),
                  //subtitle: Text(widget.userDoc['NAME']),
                  subtitle: Text('Name'),
                )
              )
            ),
            Padding(
            padding: EdgeInsets.only(top: 8),
              child: Card(
                margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                child: ListTile(
                  leading: Icon(Icons.person, color: Colors.blue,),
          
                  title: Text('Date of Birth'),
                  subtitle: Text(widget.userDoc['DATE OF BIRTH']),
                )
              )
            ),
           
         ],
     ); 
    */
         },
     );
     
  }
  
  //setIsMovedEmployee(true);
    EmployeeDoc getEmployeeDoc(employeeData,employeeList) {
    for (var employee in employeeList) {
      if(employee.employeeDoc['NAME'] == employeeData.name && employee.employeeDoc['DATE OF BIRTH'] == employeeData.dateOfBirth) {
        print('This is my Employeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        return employee;
      }
    }
  }
  
  //move the employee document returned from the getEmployeeDoc function above into Beloxxi_data collection 
  //and then delete the document from employee_list
  Future moveThenDeleteEmployee(user,employeeData,employeeList) async {
    Map<String, dynamic> employee= getEmployeeDoc(employeeData,employeeList).employeeDoc;
    //print(employee);
    print('Buffer');
    print(user.uid);
    
    //reset the beloxxi_data collection
    await beloxxiData.document(user.uid).setData({
      'EMAIL': employeeData.email,
      'PASSWORD': employeeData.password,
      'NAME': employee['NAME'] ?? 'N/A',
      'DATE OF BIRTH': employee['DATE OF BIRTH'] ?? 'N/A',
      'SEX': employee['SEX'] ?? 'N/A',
      'STATE OF ORIGIN': employee['STATE OF ORIGIN'] ?? 'N/A',
      'ADDRESS': employee['ADDRESS'] ?? 'N/A',
      'TELEPHONE 1':employee['TELEPHONE 1'] ?? 'N/A',
      'POC ADDRESS': employee['POC ADDRESS'] ?? 'N/A',
      'NOK ADDRESS': employee['NOK ADDRESS'] ?? 'N/A',
      'TELEPHONE 2': employee['TELEPHONE 2'] ?? 'N/A',
      'REFERALS': employee['REFERALS'] ?? 'N/A',
      'DESIGNATION': employee['DESIGNATION'] ?? 'N/A',
      'DATE OF ENTRY': employee['DATE OF ENTRY'] ?? 'N/A',
      'MONTH': employee['MONTH'] ?? 'N/A',
  });

  widget.setIsMovedEmployee();
  }
}
*/


/*
class ParseMyEmployeeList {
  final User user;
  final EmployeeData employeeData;
  final List<EmployeeDoc> employeeList;
  final CollectionReference beloxxiData= Firestore.instance.collection('beloxxi_data');
  //final Function setIsMovedEmployee;

  ParseEmployeeList({@required this.user, @required this.employeeData, @required this.employeeList});

  EmployeeDoc getEmployeeDoc() {
    for (var employee in employeeList) {
      if(employee.employeeDoc['NAME'] == employeeData.name && employee.employeeDoc['DATE OF BIRTH'] == employeeData.dateOfBirth) {
        print('This is my Employeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        return employee;
      }
    }
  }
  
  //move the employee document returned from the getEmployeeDoc function above into Beloxxi_data collection 
  //and then delete the document from employee_list
  Future moveThenDeleteEmployee(Function setIsMovedEmployee) async {
    Map<String, dynamic> employee= getEmployeeDoc().employeeDoc;
    //print(employee);
    print('Buffer');
    print(user.uid);
    
    //reset the beloxxi_data collection
    await beloxxiData.document(user.uid).setData({
      'EMAIL': employeeData.email,
      'PASSWORD': employeeData.password,
      'NAME': employee['NAME'] ?? 'N/A',
      'DATE OF BIRTH': employee['DATE OF BIRTH'] ?? 'N/A',
      'SEX': employee['SEX'] ?? 'N/A',
      'STATE OF ORIGIN': employee['STATE OF ORIGIN'] ?? 'N/A',
      'ADDRESS': employee['ADDRESS'] ?? 'N/A',
      'TELEPHONE 1':employee['TELEPHONE 1'] ?? 'N/A',
      'POC ADDRESS': employee['POC ADDRESS'] ?? 'N/A',
      'NOK ADDRESS': employee['NOK ADDRESS'] ?? 'N/A',
      'TELEPHONE 2': employee['TELEPHONE 2'] ?? 'N/A',
      'REFERALS': employee['REFERALS'] ?? 'N/A',
      'DESIGNATION': employee['DESIGNATION'] ?? 'N/A',
      'DATE OF ENTRY': employee['DATE OF ENTRY'] ?? 'N/A',
      'MONTH': employee['MONTH'] ?? 'N/A',
  });

  setIsMovedEmployee(true);
  }

}
*/