import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:beloxxi_app/models/image.dart';
import 'package:beloxxi_app/models/employee_data.dart';
import 'package:beloxxi_app/models/employee_doc.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference beloxxiData= Firestore.instance.collection('beloxxi_data');
  final CollectionReference images= Firestore.instance.collection('images');
  final CollectionReference employeeList= Firestore.instance.collection('employee_list');
/*
  Future saveUserData({String name, String serialno, String position, String lockerno, String email, String password,}) async{
    return await beloxxiData.document(uid).setData({
      'name': name,
      'serialno': serialno,
      'position': position,
      'lockerno': lockerno,
      'email': email,
      'password': password
  });
  }
*/


  Future saveUserData({String email, String password,String name,String dateOfBirth,String serialno}) async{
    return await beloxxiData.document(uid).setData({
      'EMAIL': email,
      'PASSWORD': password,
      'NAME': name,
      'DATE OF BIRTH':dateOfBirth,
      'SERIAL NUMBER': serialno
    });
  }
  
  Future updateEmployeeData(userDocument, {String name, String address,String designation,int telephone1, int telephone2}) async{
    return await beloxxiData.document(uid).updateData({
      'ADDRESS': address ?? userDocument['ADDRESS'],
      'DESIGNATION': designation ?? userDocument['DESIGNATION'],
      'NAME': name ?? userDocument['NAME'],
      'TELEPHONE 1': telephone1 ?? userDocument['TELEPHONE 1'],
      'TELEPHONE 2': telephone2 ?? userDocument['TELEPHONE 2']
    });
  }

Future enterImageData({String image}) async{
  //save an image in firebase image collection
    return await images.document(uid).setData({
      'image': image,
  });
  }
  
Future enterEmployeeList({List inputData}) async{
    return await employeeList.document().setData({
      'NAME':inputData[1] != null ? inputData[1] : 'N/A',//note: an alternative for this logic is inputData[1] ?? 'N/A'
      'SEX':inputData[2] != null ? inputData[2] : 'N/A',
      'DATE OF BIRTH':inputData[3] != null ? inputData[3] : 'N/A',
      'STATE OF ORIGIN':inputData[4] != null ? inputData[4] : 'N/A',
      'ADDRESS':inputData[5] != null ? inputData[5] : 'N/A',
      'TELEPHONE 1':inputData[6] != null ? inputData[6] : 'N/A',
      'POC ADDRESS':inputData[7] != null ? inputData[7] : 'N/A',
      'NOK ADDRESS':inputData[9] != null ? inputData[9] : 'N/A',
      'TELEPHONE 2':inputData[10] != null ? inputData[10] : 'N/A',
      'REFERALS':inputData[11] != null ? inputData[11] : 'N/A',
      'DESIGNATION':inputData[12] != null ? inputData[12] : 'N/A',
      'DATE OF ENTRY':inputData[13] != null ? inputData[13] : 'N/A',
      'MONTH':inputData[14] != null ? inputData[14] : 'N/A',
  });
  }

  //Create a function that takes a QuerySnapshot as an argument and 
  //returns a list of DocumentSnapshot of image documents
  List<ImageDoc> imageListFromSnapshot(QuerySnapshot snapshot) {
  return snapshot.documents.map(
    (doc) {
        return ImageDoc(
          imageDoc: doc
        );

    }
  ).toList();
}

  //Create a function that takes a QuerySnapshot as an argument and returns a 
  //list of DocumentSnapshot of employee documents
  List<EmployeeDoc> employeeListFromSnapshot(QuerySnapshot snapshot) {
  return snapshot.documents.map(
    (doc) {
        return EmployeeDoc(
          employeeDoc: doc.data
        );

    }
  ).toList();
}//End of function employeeListFromSnapshot

  //Create a function that takes a DocumentSnapshot as an argument and returns a 
  //Model EmployeeData containing a Map (This Map holds employee data Email, name, password and date of birth) 
EmployeeData employeeDataFromSnapshot(DocumentSnapshot doc) {
    try{
        return EmployeeData(email: doc.data['EMAIL'], password: doc.data['PASSWORD'], name: doc.data['NAME'], 
        dateOfBirth: doc.data['DATE OF BIRTH']);
    }catch(e){

    }
  
}

//create getters that return individual streams: Each getter returns a single stream
Stream<List<EmployeeDoc>> get employeelist {
    return employeeList.snapshots().map(employeeListFromSnapshot);
}

Stream<EmployeeData> get beloxxiEmployeeData {
  try{
    return beloxxiData.document(uid).snapshots().map(employeeDataFromSnapshot);
  }catch(e){

  }
    
}

Stream<List<ImageDoc>> get image {
    return images.snapshots().map(imageListFromSnapshot);
}
//create getters that return individual streams: Each getter returns a single stream
}//End of Class DatabaseService