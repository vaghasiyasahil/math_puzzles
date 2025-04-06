import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_puzzles/Alldata.dart';
import 'package:math_puzzles/Answer_Page.dart';
import 'package:math_puzzles/Home_Page.dart';
import 'package:math_puzzles/main.dart';

class LevelsPage extends StatefulWidget {
  const LevelsPage({super.key});

  @override
  State<LevelsPage> createState() => _LevelsPageState();
}

class _LevelsPageState extends State<LevelsPage> {

  int position=0;

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/img/background.jpg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Container(
              width: 500,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Text(
                        "Select Puzzle",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 66, 81, 182),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 10,),
                  Expanded(
                    flex: 24,
                    child: GridView.builder(
                          itemCount: 24,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                          itemBuilder: (context, index) {
                            index=position+index;
                            return
                              InkWell(
                                onTap: () {
                                  if(levelsNum>=index){
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AnswerPage(index+1),));
                                  }
                                },
                                child: Stack(
                                    alignment: Alignment.center,
                                    children:[
                                      Container(
                                        // padding: EdgeInsets.only(top: 15,bottom: 15,right: 25,left: 25),
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            border: (levelsNum>=index)?Border.all(color: Colors.black,width: 0.7):null
                                        ),
                                        margin: EdgeInsets.all(10),
                                        child: (levelsNum!=index)?
                                                  (levelsNum-1<index)?
                                                    Image.asset("assets/img/lock.png")
                                                    :(allData.write_Arrow[index]=="true")?
                                                      Image.asset("assets/img/tick.png"):
                                                    null:
                                                null,
                                      ),
                                      Text(
                                        (levelsNum>=index)?"${index+1}":"",
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontFamily: "F1"
                                        ),
                                      ),
                                    ]
                                ),
                              );
                          },
                        ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          padding: EdgeInsets.only(left: 5),
                            child: (position>=24)?InkWell(
                              onTap: () {
                                if(position>=24){
                                  position-=24;
                                  setState(() { });
                                }
                              },
                              child: Image.asset(
                                "assets/img/back.png",
                                width: double.infinity,
                                height :double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ):null,
                        ),
                        Container(
                          width: 50,
                            padding: EdgeInsets.only(right: 5),
                            // height: 30,
                            // padding: EdgeInsets.only(left: 30,right: 30,bottom: 30),
                            child: (position<=51)?InkWell(
                              onTap: () {
                                if(position<=51){
                                  position+=24;
                                  setState(() { });
                                }
                              },
                              child: Image.asset(
                                "assets/img/next.png",
                                width: double.infinity,
                                height :double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ):null,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}