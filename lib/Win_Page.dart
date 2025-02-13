import 'package:flutter/material.dart';
import 'package:math_puzzles/Answer_Page.dart';
import 'package:math_puzzles/Home_Page.dart';

class WinPage extends StatefulWidget {
  int levelsNum;
  WinPage(this.levelsNum,{super.key});

  @override
  State<WinPage> createState() => _WinPageState();
}

class _WinPageState extends State<WinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              Image.asset(
                "assets/img/background.jpg",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(30),
                      alignment: Alignment.center,
                      child: Text(
                        "PUZZLE ${widget.levelsNum} COMPLETED",
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 66, 81, 182),
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Image.asset(
                        "assets/img/trophy.png"
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AnswerPage(widget.levelsNum+1),));
                      },
                      child: Container(
                        width: 150,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(colors:[
                              Colors.grey,
                              Colors.white60,
                              Colors.grey,
                              Colors.grey
                          ]),
                        ),
                        child: Text(
                          "CONTINUE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "F1",
                            fontSize: 18
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(),), (route) => false,);
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                      },
                      child: InkWell(
                        child: Container(
                          width: 150,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(colors:[
                                Colors.grey,
                                Colors.grey,
                                Colors.white60,
                                Colors.grey
                              ])
                          ),
                          child: Text(
                              "MAIN MENU",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "F1",
                                fontSize: 18
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
