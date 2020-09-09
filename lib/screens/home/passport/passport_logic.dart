import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:beloxxi_app/screens/home/inherited_widget.dart';
import 'package:beloxxi_app/models/user.dart';

final CollectionReference beloxxiData= Firestore.instance.collection('beloxxi_data');


//create a getImage function
Future getImage(BuildContext context, DocumentSnapshot employeeDocument) async{
  try{
    final User user= InheritWidget.of(context).user;
    var image= await ImagePickerSaver.pickImage(source: ImageSource.gallery);
    //todo: Find out the extension of the file whether jpg or png before uploading to storage
     uploadImageToFirebase(image, user, employeeDocument);
  }catch(error){
    Navigator.pop(context);
  }
}

//create auploadImageToFirebase Function
uploadImageToFirebase(File image, User user, DocumentSnapshot employeeDocument) async{
  try{
    
    //image name
    //todo: find a way to make the extension assigned to the var imageLocation dynamic not hard coded
    //find out how to get the extension of a file path in flutter

    String imageLocation= 'Employeepassport/image${user.uid}.jpg';


    //create a firebase storage using the imageLocation as the path where the images are stored
    final StorageReference storageReference= FirebaseStorage().ref().child(imageLocation);

    //upload image to firebase storage
    final StorageUploadTask uploadTask= storageReference.putFile(image);
    await uploadTask.onComplete;
    _addPathToDatabase(imageLocation, employeeDocument, user);
  }catch(e) {
    print(e.message);
  }
}

//create a _addPathToDatabase Function
Future _addPathToDatabase(String imagePath, DocumentSnapshot employee, User user) async{
  try{
    //get image url from firebase- the image url is the path of the firebase storage where the images are stored
    //the image url is used to create a kind of link between the storage and the database
    final ref= FirebaseStorage().ref().child(imagePath);
    var imageString= await ref.getDownloadURL();

  /*
    //add url to database
  await beloxxiData.document(user.uid).setData({
      'EMAIL': employee['EMAIL'],
      'PASSWORD': employee['PASSWORD'],
      'NAME': employee['NAME'],
      'DATE OF BIRTH': employee['DATE OF BIRTH'],
      'SEX': employee['SEX'],
      'STATE OF ORIGIN': employee['STATE OF ORIGIN'],
      'ADDRESS': employee['ADDRESS'],
      'TELEPHONE 1':employee['TELEPHONE 1'],
      'POC ADDRESS': employee['POC ADDRESS'],
      'NOK ADDRESS': employee['NOK ADDRESS'],
      'TELEPHONE 2': employee['TELEPHONE 2'],
      'REFERALS': employee['REFERALS'],
      'DESIGNATION': employee['DESIGNATION'],
      'DATE OF ENTRY': employee['DATE OF ENTRY'],
      'MONTH': employee['MONTH'],
      'PASSPORT URL': imagePath,
      'PASSPORT LOCATION': imageString
  });
*/
//Note: This code is still being tested
  await beloxxiData.document(user.uid).setData({
    'PASSPORT URL': imagePath,
    'PASSPORT LOCATION': imageString
  },merge: true);
  }catch(e){
    //print the error message
    print(e.message);
  }
}