import 'package:flutter/material.dart';
import 'package:beloxxi_app/screens/home/income_2018.dart';
import 'package:beloxxi_app/screens/home/income_2019.dart';

class IncomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1,0.5,0.8,1.0],
          colors: [Colors.blue, Colors.purple, Colors.yellow, Colors.blueGrey]
        )
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //2018 btn
            GestureDetector(
              child: Container(
                width: 300.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    //stops: [0.1,0.5,0.8,1.0],
                    colors: [Colors.red, Colors.blue]
                  )
                ),
                child: Text('2018', textAlign: TextAlign.center, 
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,color: Colors.white)),
              ),
              onTap: () {
           
                Navigator.push(context, MaterialPageRoute(builder: (context){
                      return IncomeScreen2018();
                    })
                  );
            
              }
            ), 

            //2019 btn
            GestureDetector(
              child: Container(
                width: 300.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.purple, Colors.yellow]
                  )
                ),
                child: Text('2019', textAlign: TextAlign.center, 
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,color: Colors.white)),
              ),
               onTap: () {
           
                Navigator.push(context, MaterialPageRoute(builder: (context){
                      return IncomeScreen2019();
                    })
                  );
            
              }
            ) 
          ],
        ),
      ),
    );
  }
}