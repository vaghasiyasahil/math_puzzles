import 'package:flutter/material.dart';
import 'package:math_puzzles/Home_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.setMemory();
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        // home: WinPage(1),
      )
  );
}

class Preferences{
  static late SharedPreferences prefs;
  static setMemory() async {
    prefs = await SharedPreferences.getInstance();
  }
  static setLevels(int levels){
    prefs.setInt("setLevels", levels);
  }
  static setSkipLevels(List<String> skip){
    prefs.setStringList("skipLevels", skip);
  }
  static List<String> getSkipLevels(){
    return prefs.getStringList("skipLevels")??List.filled(75, "false");
  }
  static int getLevels(){
    return prefs.getInt("setLevels")??0;
  }
}