import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Ground(),
  ));
}

class Ground extends StatefulWidget {
  @override
  State<Ground> createState() => _GroundState();
}

class _GroundState extends State<Ground> {
  int runs =0;
  int ball =6;
  String x ="runs";
  late int r ;

  score(){

    setState(() {
      r= Random().nextInt(7);
      runs= runs+r;
      ball=ball-1;
      x="$r Runs";
    });



  }
  restart() {
    setState(() {
      r=0;
      x="$r Runs";

      runs= 0 ;
      ball=6;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 76, 126),
        title: Text("Mini Cricket",
        style: TextStyle(
            color:Colors.white,
            fontWeight: FontWeight.w900,
        )),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset("Images/ball.jpg",scale: 1.5,
                    height:165,width:165,), // Ensure the image path is correct
                  Text(
                    "Runs",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    runs.toString(),
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Image.asset("Images/ball.jpg",scale: 1.5,
                    height:165,width:165,), // Ensure the image path is correct
                  Text(
                    "Balls",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                   ball.toString(),
                    style: TextStyle(
                      fontSize: 50,),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(x,style: TextStyle(
                      fontSize: 50,
                    ))
                    ,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:ball>0? Colors.blue:Colors.red,
                         minimumSize: Size(200, 60),// Background color
                        foregroundColor: Colors.white,), // Text color
                  onPressed: ball >0? score :restart,
                      child: Text(ball>0? "Bat":"Resatart",
                      style:TextStyle(fontSize: 40,),
                  )
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}