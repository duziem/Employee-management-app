import 'dart:io';
import 'package:csv/csv.dart' as csv;
import 'package:path_provider/path_provider.dart';

class DbList {
 // List<List> convertedlist;
   // File csvfile;
   /*
   DbList() {
     print(csvToList());
   } */
   Future<List<List>> getDbList() async {
    List<List> listcreated = await csvToList();
    //convertedlist= listcreated;
    return listcreated;
  }
  /*
 dbList() {
    convertedlist = csvToList();
    return convertedlist;
  }
  */

   Future<String> get getfilePath async {
    final directory= await getApplicationDocumentsDirectory();
    return directory.path;

  }


   Future<File> get getFile async {
    final String csvfile= await getfilePath;
    return new File("$csvfile/list2020.csv");
  }
 

   //convert csv file to a list
  
  Future<List<List>> csvToList() async {
    File csvfile= await getFile;
    csv.CsvToListConverter converter= new csv.CsvToListConverter(
      eol: '\r\n', fieldDelimiter: ','
    );
    List<List> listcreated= converter.convert(csvfile.readAsStringSync());
     // print(listcreated);
      return listcreated;

  }

}