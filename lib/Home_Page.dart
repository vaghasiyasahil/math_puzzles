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
  bool continueButton = true;
  bool puzzlesButton = true;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Are you sure you want to exit?"),
              actions: [
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text("Yes", style: TextStyle(color: Colors.red)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  "assets/img/background.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  double maxW = constraints.maxWidth;
                  double maxH = constraints.maxHeight;
                  double boardW = maxW > 600 ? 400 : maxW - 40;
                  double boardH = maxH > 700 ? 600 : maxH - 150;

                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: maxH),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30),
                          Text(
                            "Math Puzzels",
                            style: TextStyle(
                              fontSize: maxW < 400 ? 20 : 28,
                              color: Color.fromARGB(255, 66, 81, 182),
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(height: 15),
                          Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  "assets/img/blackboard_main_menu.png",
                                  width: boardW,
                                  height: boardH,
                                  fit: BoxFit.fill,
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        levelsNum = Preferences.getLevels();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AnswerPage(levelsNum + 1),
                                          ),
                                        );
                                      },
                                      onTapDown: (_) {
                                        setState(() {
                                          continueButton = false;
                                        });
                                      },
                                      onTapUp: (_) {
                                        setState(() {
                                          continueButton = true;
                                        });
                                      },
                                      onTapCancel: () {
                                        setState(() {
                                          continueButton = true;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 25),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: continueButton ? 0 : 1,
                                            color: continueButton
                                                ? Colors.transparent
                                                : Colors.white,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          "CONTINUE",
                                          style: TextStyle(
                                            fontFamily: "F1",
                                            color: Colors.white,
                                            fontSize: maxW < 400 ? 14 : 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        levelsNum = Preferences.getLevels();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LevelsPage(),
                                          ),
                                        );
                                      },
                                      onTapDown: (_) {
                                        setState(() {
                                          puzzlesButton = false;
                                        });
                                      },
                                      onTapUp: (_) {
                                        setState(() {
                                          puzzlesButton = true;
                                        });
                                      },
                                      onTapCancel: () {
                                        setState(() {
                                          puzzlesButton = true;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 25),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: puzzlesButton ? 0 : 1,
                                            color: puzzlesButton
                                                ? Colors.transparent
                                                : Colors.white,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          "PUZZLES",
                                          style: TextStyle(
                                            fontFamily: "F1",
                                            color: Colors.white,
                                            fontSize: maxW < 400 ? 14 : 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
