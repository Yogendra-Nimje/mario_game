import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mario_game/mario.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}



class _GamePageState extends State<GamePage> {
  static double marioX= 0;
  static double marioY=1;
  double time=0;
  double height=0;
  double initialHeight=marioY;
  var gamefont= GoogleFonts.pressStart2p(
    textStyle: const TextStyle(color: Colors.white,fontSize: 20),

  );



  void preJump(){
    time =0;
    initialHeight=marioY;
  }


  //jump function
  void jump(){
    preJump();
    setState(() {
      marioY=0.7;
    });
    Timer.periodic(const Duration(microseconds: 0), (timer) {
      time += 0.05;
      height = -4.9*time* time + 5 * time ;
    });
  }


  void down(){
    setState(() {
      marioY=1;
    });
  }

  void forward(){
    setState(() {
      marioX=0.5;
    });
  }

  void back(){
    setState(() {
      marioX=-0.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  color: Colors.blue,
                  child:AnimatedContainer(
                    alignment: Alignment(marioX,marioY),
                    duration: const Duration(microseconds: 0),
                    child: const  MyMario(),
                  )
                ),
                 Padding(
                  padding: const EdgeInsets.all(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [Text("SCORE",style: gamefont), Text("0",style: gamefont), ],
                      ),
                      Column(children: [Text("TIME",style: gamefont),  Text("1-1",style:gamefont),],
                      ),
                      const Column(
                        children: [
                          Row(
                            children:[
                              Icon(Icons.favorite,color: Colors.white,),
                              Icon(Icons.favorite,color: Colors.white,),
                              Icon(Icons.favorite,color: Colors.white,)] ,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 10,
            color: Colors.green,

          ),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.white54,
                      onPressed: back,
                      child: const Icon(Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),

                    Column(
                      children: [
                        FloatingActionButton(
                          backgroundColor: Colors.white54,
                          onPressed: jump,
                          child: const Icon(Icons.arrow_upward,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        FloatingActionButton(
                          backgroundColor: Colors.white54,
                          onPressed: down,
                          child: const Icon(Icons.arrow_circle_down_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white54,
                      onPressed: forward,
                      child: const Icon(Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}