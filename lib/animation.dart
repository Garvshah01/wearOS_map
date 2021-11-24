import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_map/list.dart';
import 'Map_g2.dart';

class AnimationL extends StatefulWidget{
  int Pages;

  AnimationL(this.Pages);
  
  @override
  State<AnimationL> createState() => _AnimationLState(Pages);
}

class _AnimationLState extends State<AnimationL> 
with SingleTickerProviderStateMixin{
   AnimationController controller;

    int PageValue;
    _AnimationLState(this.PageValue);
  @override
  void initState(){
    super.initState();

    controller=AnimationController( vsync: this,
      duration: Duration(seconds: 2),
    );

    controller.addStatusListener((status) async {
      if(status==AnimationStatus.completed && PageValue==0){
        Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GoogleMapScreen()));
      }
      if(status==AnimationStatus.completed && PageValue==1){
        Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PoiList()));
      }
    });
  }

  @override
  void dispose()
  {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Lottie.network('https://assets7.lottiefiles.com/packages/lf20_svy4ivvy.json',
           controller: controller,
           onLoaded:(composition){
             controller.forward();
           }, ), 
        ),
      ),
    );
  }
}