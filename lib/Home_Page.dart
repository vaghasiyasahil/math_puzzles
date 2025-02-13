import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_puzzles/Alldata.dart';
import 'package:math_puzzles/Answer_Page.dart';
import 'package:math_puzzles/Levels_Page.dart';
import 'package:math_puzzles/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
late double screenWidth;
late double screenHeight;
late int levelsNum;
class _HomePageState extends State<HomePage> {

  bool continueButton=true;
  bool puzzlesButton=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth=MediaQuery.of(context).size.width;
    screenHeight=MediaQuery.of(context).size.height;
    return PopScope(
        child: Scaffold(
          body: SafeArea(
            child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/img/background.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30,bottom: 15),
                        child: Text(
                          "Math Puzzels",
                          style: TextStyle(
                              fontSize: 25,
                              // rgba(66,81,182,255)
                              // color: Colors.blue,
                              color: Color.fromARGB(255, 66, 81, 182),
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Stack(
                            alignment: Alignment.center,
                            children:[
                              Image.asset(
                                "assets/img/blackboard_main_menu.png",
                                width: screenWidth-40,
                                height: screenHeight-150,
                                fit: BoxFit.fill,
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      levelsNum=Preferences.getLevels();
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AnswerPage(levelsNum+1),));
                                    },
                                    onTapDown: (details) {
                                      setState(() {
                                        continueButton=false;
                                      });
                                    },
                                    onTapUp: (details) {
                                      setState(() {
                                        continueButton=true;
                                      });
                                    },
                                    onVerticalDragCancel: () {
                                      setState(() {
                                        continueButton=true;
                                      });
                                    },
                                    onHorizontalDragCancel: () {
                                      setState(() {
                                        continueButton=true;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      padding: EdgeInsets.only(top: 5,bottom: 5,right: 15,left: 15),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: continueButton?0:1,
                                              color: continueButton?Colors.black:Colors.white
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      child: Text(
                                        "CONTINUE",
                                        style: TextStyle(
                                            fontFamily: "F1",
                                            color: Colors.white,
                                            fontSize: 20
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        levelsNum=Preferences.getLevels();
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => LevelsPage(),));
                                      });
                                    },
                                    onTapDown: (details) {
                                      setState(() {
                                        puzzlesButton=false;
                                      });
                                    },
                                    onTapUp: (details) {
                                      setState(() {
                                        puzzlesButton=true;
                                      });
                                    },
                                    onVerticalDragCancel: () {
                                      setState(() {
                                        puzzlesButton=true;
                                      });
                                    },
                                    onHorizontalDragCancel: () {
                                      setState(() {
                                        puzzlesButton=true;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      padding: EdgeInsets.only(top: 5,bottom: 5,right: 15,left: 15),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: puzzlesButton?0:1,
                                              color: puzzlesButton?Colors.black:Colors.white
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      child: Text(
                                        "PUZZLES",
                                        style: TextStyle(
                                            fontFamily: "F1",
                                            color: Colors.white,
                                            fontSize: 20
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ]
                        ),
                      )
                    ],
                  )
                ]
            ),
          ),
        ),
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if(!didPop){
          showDialog(context: context, builder: (context) => AlertDialog(
              title: Text("Are you sure you want to exit?"),
              actions: [
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  }, child: Text(
                    "Yes",
                  style: TextStyle(
                    color: Colors.red
                  ),
                )),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, child: Text(
                    "No",
                  style: TextStyle(
                      color: Colors.red
                  ),
                )),
              ],
            ),);
        }
      },
    );
  }
}
