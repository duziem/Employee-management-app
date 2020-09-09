import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:beloxxi_app/models/image.dart';
import 'package:flutter/painting.dart';
import 'package:beloxxi_app/screens/home/image_gallery/image_preview.dart';




class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {

  @override
  Widget build(BuildContext context) {
    final imageData= Provider.of<List<ImageDoc>>(context);
    //print (imageDoc);
    //clearCache();
    return Scaffold(
      appBar: AppBar(
      title:Text('Info'),
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
    ),

    body: _buildList(context, imageData),

  
    floatingActionButton: FloatingActionButton(
      onPressed: () => getImage(context),
      child: Icon(Icons.add_a_photo),
    ),
    );
  }
}

//create the record model
class Record{
  final String location;
  final String url;
  final DocumentReference reference;//used to store a snapshot reference

  Record.fromMap(Map<String, dynamic> map, {this.reference})
     : assert(map['location'] != null),
        assert(map['url'] != null),
        location= map['location'],
        url= map['url'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$location:$url>";
}

Widget _buildList(BuildContext context, snapshot) {
  if(snapshot== null){return LinearProgressIndicator();}
  return GridView.extent(
    key: ValueKey(Random(100000)),
    maxCrossAxisExtent: 150.0,
    mainAxisSpacing: 5.0,
    //crossAxisSpacing: 5.0,
    //padding: const EdgeInsets.all(5.0),
    children: _buildGridTiles(snapshot.length, snapshot, context)
);
}


//create a _buildGridTiles Function

List<Widget> _buildGridTiles(numberOfTiles, snapshot, BuildContext context){
  
  List<Container> containers= List<Container>.generate(numberOfTiles, (int i){
    //final imageName= snapshot[i];
    final record= Record.fromSnapshot(snapshot[i].imageDoc);
    
    
    return Container(
      child: GestureDetector(
         child: Image.network(record.url, fit: BoxFit.cover,),
         onTap: () {
           
           Navigator.push(context, MaterialPageRoute(builder: (context){
                return ImagePreview(record.url);
              })
            );
            
         }
      ) 
    );
  });
  return containers;
}


//create a getImage function
Future getImage(BuildContext context) async{
  try{
    var image= await ImagePickerSaver.pickImage(source: ImageSource.gallery);
     uploadImageToFirebase(image);
  }catch(error){
    Navigator.pop(context);
  }
}

//create auploadImageToFirebase Function
uploadImageToFirebase(File image) async{
  try{
    //make random image name
    String imageLocation= 'images/image${Random().nextInt(100000)}.jpg';

    //find out how to get the extension of a file path in flutter

    //ccreate a firebase storage using the imageLocation as the path where the images are stored
    final StorageReference storageReference= FirebaseStorage().ref().child(imageLocation);
    //upload image to firebase storage
    final StorageUploadTask uploadTask= storageReference.putFile(image);
    await uploadTask.onComplete;
    _addPathToDatabase(imageLocation);
  }catch(e) {
    print(e.message);
  }
}

//create a _addPathToDatabase Function
Future _addPathToDatabase(String imagePath) async{
  try{
    //get image url from firebase- the image url is the path of the firebase storage where the images are stored
    //the image url is used to create a kind of link between the storage and the database
    final ref= FirebaseStorage().ref().child(imagePath);
    var imageString= await ref.getDownloadURL();

    //add url to database
  await Firestore.instance.collection('images').document().setData({
    'url': imageString,
    'location': imagePath
  });

  }catch(e){
    //print the error message
    print(e.message);
  }
}