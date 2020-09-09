import 'package:flutter/material.dart';
import 'package:beloxxi_app/services/db_list.dart';
import 'package:beloxxi_app/services/database.dart';

class ShowList extends StatefulWidget {
  @override
  _ShowListState createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {

  DbList dblist= DbList();
  DatabaseService db= DatabaseService();
  //String showListState= 'Loading...';
 // List<List> db;
 /*
@override
 initState(){
   DbList().dbList();
   super.initState();
 }
 */
  //bool isShowList= false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dblist.getDbList(),
      builder: (context, inputData) {
        if(!inputData.hasData){
          return Text('Error');
        }

        return Container(
          color: Colors.white,
          child: Center(
            child: FlatButton(
              color: Colors.blueGrey,
              child: Text('Enter Data'),
              onPressed: () async{
                await insertListIntoDb(inputData.data);
              },
            )
          ),
        ); 
      },
    );
    
    
  }
  Future<void> insertListIntoDb(inputData) async{
      for(int i=1;i<inputData.length;i++){
        await db.enterEmployeeList(inputData : inputData[i]).then((data) {print(data);}, onError: (error){print('none');});
      }
  }
}
 
 /*
 listDb() {
   List<List> db= DbList().convertedlist;
   return db.length!= 0 ? ListView.builder(
              itemCount: db.length,
              itemBuilder: (BuildContext context, int index) {
                return Text('List $index');
              },
    ) : Text('No Data');
 }
 */