import 'package:flutter/material.dart';
import 'package:beloxxi_app/models/user.dart';
import 'package:beloxxi_app/models/employee_data.dart';
import 'package:beloxxi_app/models/employee_doc.dart';

class InheritWidget extends InheritedWidget {
  final User user;
  final EmployeeData employeeData;
  final List<EmployeeDoc> employeeList;
  final name;
  final dob;

  InheritWidget({this.dob, this.user, this.employeeData, this.employeeList,this.name, Widget child})
   : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static InheritWidget of(BuildContext context) => 
  context.dependOnInheritedWidgetOfExactType();
}

/*
class InheritTextFromRegisterWidget extends InheritedWidget {
  final String nameText;
  final String dateOfBirthText;
  final String emailText;
  final String passwordText;
  final String serialnoText;
  final String positionText;
  final String lockernoText;

  InheritTextFromRegisterWidget({this.nameText, this.dateOfBirthText, this.emailText, this.passwordText, 
  this.serialnoText, this.positionText, this.lockernoText, Widget child});

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static InheritTextFromRegisterWidget of(BuildContext context) => 
  context.dependOnInheritedWidgetOfExactType();
}
*/