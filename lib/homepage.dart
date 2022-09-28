import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  double boxHeight = 100;
  double boxWidth = 100;
  var boxColor = Colors.red;
  double boxX = -1;
  double boxY = -1;
  bool startBool = true;

  void _expandBox(){

    setState((){
      if(startBool){
        boxHeight = 300;
        boxWidth = 300;
        startBool = false;
      }else{
        boxHeight = 100;
        boxWidth = 100;
        startBool = true;
      }
      _changeBoxColor();
      _moveBox();
    });
  }

  void _changeBoxColor(){
    setState((){
      if(startBool)
          boxColor = Colors.deepPurple;
      else
        boxColor = Colors.red;
    });
  }

  void _moveBox(){
    setState((){
      if(startBool){
        boxX = 1;
        boxY = 1;
      }else{
        boxX = -1;
        boxY = -1;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _expandBox,
      child: Scaffold(
        backgroundColor: Colors.deepPurple.shade200,
        body: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 3),
            alignment: Alignment(boxX, boxY),
            child: AnimatedContainer(
              duration: Duration(seconds: 3),
              height: boxHeight,
              width: boxWidth,
              color: boxColor,
            ),
          ),
        ),
      ),
    );
  }
}