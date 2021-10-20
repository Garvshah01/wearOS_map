
import 'package:flutter/material.dart';
import 'Map1.dart';
import 'package:wear/wear.dart';

class NewPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _NewPageState();

}

class _NewPageState extends State<NewPage>{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:WatchShape(builder: (context,shape,child){return
        Container(
            child: Center(
              child: Column(
                  children: [

                    SizedBox(height: 50,),
                    ElevatedButton(onPressed: () =>Navigator.push(context ,MaterialPageRoute(builder: (context) => GoogleMapScreen())), child: Text("Open Map")),

                    SizedBox(height: 10,),

                  ]),
            ));
    },
    child: AmbientMode(builder: (context,mode,child){
    return Text("Ambient Mode");
    },),
    ));
  }
}