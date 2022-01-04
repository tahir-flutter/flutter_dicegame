import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
void main(){
  runApp(Dicegame());
}
class Dicegame extends StatefulWidget{
  @override
  _DicegameState createState() => _DicegameState();
}
class _DicegameState extends State<Dicegame>{
  final player =AudioCache();
  int num=1;
  int numm=1;
  void click(){
    setState(() {
      num=Random().nextInt(6)+1;
      numm=Random().nextInt(6)+1;
    });
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        backgroundColor:Colors.white,
        appBar:AppBar(
          backgroundColor:Colors.black,
          title:Text(
            'DICE GAME',
            style:TextStyle(
              fontSize:30.0,
              color:Colors.white,
            ),
          ),
          centerTitle: true,
          leading:Icon(Icons.menu,size:30,color:Colors.white),
        ),
        body:SafeArea(
          child:Center(
            child:Row(
              children:<Widget>[
                Expanded(
                  child:TextButton(
                    onPressed:(){
                      click();
                      player.play('note$num.wav');
                    },
                    child:Image.asset('assets/Dice$num.png'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed:(){
                      click();
                      player.play('note$numm.wav');

                    },
                    child:Image.asset('assets/Dice$numm.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}