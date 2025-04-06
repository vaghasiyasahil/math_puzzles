import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:math_puzzles/Alldata.dart';
import 'package:math_puzzles/Home_Page.dart';
import 'package:math_puzzles/Win_Page.dart';
import 'package:math_puzzles/main.dart';

class AnswerPage extends StatefulWidget {
  int levelsNum;
  AnswerPage(this.levelsNum, {super.key});

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  bool submitButton = true;
  String values = "";

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return PopScope(
      child: Scaffold(
        body: SafeArea(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      "assets/img/gameplaybackground.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 6,
                          child: Stack(alignment: Alignment.topCenter, children: [
                            Positioned.fill(
                              child: Image.asset(
                                "assets/img/gameplaybackground.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              width: 500,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog.adaptive(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(10))),
                                                    title: Text("Skip"),
                                                    content: Text(
                                                      "Are you sure want to skip this level? You can play skipped leves later by clicking on PUZZLES menu from main screen.",
                                                      style: TextStyle(fontSize: 15),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: Text(
                                                            "CANCEL",
                                                            style: TextStyle(
                                                                color: Colors.red),
                                                          )),
                                                      TextButton(
                                                          onPressed: () {
                                                            if(widget.levelsNum>=levelsNum){
                                                              Preferences.setLevels(widget.levelsNum);
                                                            }
                                                            // Preferences.setSkipLevels(allData.write_Arrow);

                                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AnswerPage(widget.levelsNum+1),));
                                                          },
                                                          child: Text(
                                                            "OK",
                                                            style: TextStyle(
                                                                color: Colors.red),
                                                          )),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Image.asset("assets/img/skip.png"),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child:
                                          Stack(alignment: Alignment.center, children: [
                                            Image.asset(
                                              "assets/img/level_board.png",
                                              fit: BoxFit.fill,
                                              width: double.infinity,
                                            ),
                                            Text(
                                              "Puzzle ${widget.levelsNum}",
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic),
                                            )
                                          ]),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            onTap: () {
                                              showDialog(context: context, builder: (context) => AlertDialog.adaptive(
                                                title: Text("Hint"),
                                                content: Text("${allData.Hint[widget.levelsNum-1]}"),
                                                // content: Text("Levele Number*10=Answer"),
                                                actions: [
                                                  TextButton(onPressed: () {
                                                    Navigator.pop(context);
                                                  }, child: Text("OK",style: TextStyle(
                                                      color: Colors.red
                                                  ),))
                                                ],
                                              ),);
                                            },
                                            child: Image.asset("assets/img/hint.png"),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 8,
                                      child: Container(
                                        margin:
                                        EdgeInsets.only(bottom: 150, left: 10, right: 10),
                                        child: Image.asset(
                                          "assets/img/blackboard/p${widget.levelsNum}.png",
                                        ),
                                      ))
                                ],
                              ),
                            )
                          ])),
                      Expanded(
                          flex: 1,
                          child: Container(
                            width: 500,
                            color: Colors.black,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.only(left: 10),
                                          margin: EdgeInsets.only(
                                              top: 10, bottom: 10, left: 5, right: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(5))),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Text(
                                              "$values",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (values.length >= 1) {
                                                values =
                                                    values.substring(0, values.length - 1);
                                                if (values.length < 1) {
                                                  values = "0";
                                                }
                                              } else {
                                                values = "0";
                                              }
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(3),
                                            child: Image.asset(
                                              "assets/img/delete.png",
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: GestureDetector(
                                          onTap: () {
                                            if(int.parse(values)==allData.levels_Answer[widget.levelsNum-1]){
                                              if(widget.levelsNum>=levelsNum){
                                                Preferences.setLevels(widget.levelsNum);
                                              }
                                              allData.write_Arrow[widget.levelsNum-1]="true";
                                              Preferences.setSkipLevels(allData.write_Arrow);
                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WinPage(widget.levelsNum),));
                                            }else{
                                              Fluttertoast.showToast(
                                                  msg: "Wrong!!",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.white70,
                                                  textColor: Colors.black,
                                                  fontSize: 25.0
                                              );
                                            }
                                          },
                                          onTapDown: (details) {
                                            setState(() {
                                              submitButton = false;
                                            });
                                          },
                                          onTapUp: (details) {
                                            setState(() {
                                              submitButton = true;
                                            });
                                          },
                                          onVerticalDragCancel: () {
                                            setState(() {
                                              submitButton = true;
                                            });
                                          },
                                          onHorizontalDragCancel: () {
                                            setState(() {
                                              submitButton = true;
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: submitButton ? 0 : 1,
                                                    color: submitButton
                                                        ? Colors.black
                                                        : Colors.white),
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(5))),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "SUBMIT",
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: allData.Answer_Page_Button_List.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          if (values == "0") {
                                            values = "";
                                          }
                                          values +=
                                              allData.Answer_Page_Button_List.elementAt(
                                                  index)
                                                  .toString();
                                          setState(() {});
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: screenWidth<=500?(screenWidth - 38) /
                                              allData.Answer_Page_Button_List.length:460/allData.Answer_Page_Button_List.length,
                                          height: (screenWidth - 38) /
                                              allData.Answer_Page_Button_List.length,
                                          margin: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(255, 50, 50, 50),
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(5)),
                                              border: Border.all(
                                                  color: Color.fromARGB(255, 129, 129, 129),
                                                  width: 2)),
                                          child: Text(
                                            "${allData.Answer_Page_Button_List.elementAt(index)}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                )
              ],
            )
        ),
      ),
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if(!didPop){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
        }
      },
    );
  }
}
