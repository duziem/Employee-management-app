import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_saver/image_picker_saver.dart';

var filePath;//this var stores the path of the network file
class ImagePreview extends StatelessWidget {
  final String url;
  ImagePreview(this.url);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView(
          children: <Widget>[
                Container(
                  
                  child:  Image.network(url, fit: BoxFit.contain, width:400),
                  constraints: BoxConstraints.expand(
                    height: 600,
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('Save Image', style: TextStyle(fontSize: 20),),
                    onPressed: () {
                      
                      saveNetworkImage(context, url);
                      
                    },
                  ),
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text('Return', style: TextStyle(fontSize: 20.0),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                

          ],
      ),
    );
  }
}


//create a function that saves an image from the app to phone gallery
  Future<void> saveNetworkImage(BuildContext context, String url) async{

    //downloading dialog box
    showDialog(context: context, builder: (BuildContext context){
       return SimpleDialog(
         children: <Widget>[
           new CircularProgressIndicator(),
           new Text('Downloading'),
         ],
       );
    });

    //save image to phone local storage: images are saved to the pictures directory
    var response= await http.get(url);
    filePath= await ImagePickerSaver.saveFile(fileData: response.bodyBytes, title: 'Beloxxi_images');

    Navigator.pop(context);
    showDialog(context: context, builder: (BuildContext context){
       return SimpleDialog(
         children: <Widget>[
           new CircularProgressIndicator(),
           new Text('Finished Downloading'),
         ],
       );
    });

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pop(context);
    });
}