import 'package:math_puzzles/main.dart';

class allData
{
  static int totalImg=75;
  static List Answer_Page_Button_List=[1,2,3,4,5,6,7,8,9,0];
  static List levels_Answer=List.generate(75, (index) => ((index+1)*10));
  static List levels_Answer1=[
    10, //level 1
    25, //level 2
    6,  //level 3
    14, //level 4
    128, //level 5
    7, //level 6
    50, //level 7
    1025, //level 8
    100, //level 9
    3, //level 10
    212, //level 11
    3011, //level 12
    14, //level 13
    16, //level 14
    1, //level 15
    2, //level 16
    44, //level 17
    45, //level 18
    625, //level 19
    1, //level 20
    13, //level 21
    47, //level 22
    50, //level 23
    34, //level 24
    6, //level 25
    41, //level 26
    16, //level 27
    126, //level 28
    82, //level 29
    14, //level 30
    7, //level 31
    132, //level 32
    34, //level 33
    48, //level 34
    42, //level 35
    288, //level 36
    45, //level 37
    4, //level 38
    111, //level 39
    47, //level 40
    27, //level 41
    87, //level 42
    22, //level 43
    253, //level 44
    12, //level 45
    48, //level 46
    178, //level 47
    1, //level 48
    6, //level 49
    10, //level 50
    2, //level 51
    20, //level 52
    7, //level 53
    5, //level 54
    143547, //level 55
    84, //level 56
    11, //level 57
    27, //level 58
    3, //level 59
    5, //level 60
    39, //level 61
    31, //level 62
    10, //level 63
    130, //level 64
    22, //level 65
    3, //level 66
    14, //level 67
    42, //level 68
    164045, //level 69
    11, //level 70
    481, //level 71
    86, //level 72
    84, //level 73
    13, //level 74
    8, //level 75
  ];
  static List Hint=[
    "Sum",  //level 1
    "Multiplication",  //level 2
    "Each number on the left side is multiplied by a decreasing number.",  //level 3
    "Count the squares in each equation.",  //level 4
    "Look for a pattern in the numbers.",  //level 5
    "Focus on the vertical pairs of numbers.",  //level 6
    "Remember the order of operations (PEMDAS/BODMAS).",  //level 7
    "Look closely at how the numbers are combined in the equations.",  //level 8
    "The pattern involves squaring the number of digits in each number.",  //level 9
    "Look at the numbers diagonally.",  //level 10
    "Focus on how the numbers are combined in the equations.",  //level 11
    "Look closely at how the numbers are combined in the equations.",  //level 12
    "Remember the order of operations (PEMDAS/BODMAS).",  //level 13
    "Look for a relationship between the numbers in each circle.",  //level 14
    "Look at the pattern of the numbers in each row.",  //level 15
    "Look at the numbers in each row.",  //level 16
    "Focus on how the numbers are combined in the equations.",  //level 17
    "Focus on the relationship between the first two numbers in each equation and the result.",  //level 18
    "Look for a pattern in the numbers in each square.",  //level 19
    "Look at the pattern of the numbers in each row.",  //level 20
    "Count the triangles systematically, starting from the smallest ones and working your way up to larger ones.",  //level 21
    "Focus on how the numbers are combined in the equations.",  //level 22
    "Focus on the relationship between the numbers in each equation.",  //level 23
    "Focus on how the numbers are combined in the equations.",  //level 24
    "Look for a pattern in the numbers in each row and column.",  //level 25
    "Focus on how the numbers are combined in the equations.",  //level 26
    "Look for a pattern in the numbers in each row.",  //level 27
    "Focus on how the numbers are combined in the equations.",  //level 28
    "Focus on how the numbers are combined in the equations.",  //level 29
    "Focus on the relationship between the numbers in each equation.",  //level 30
    "Focus on how the numbers are combined in the equations.",  //level 31
    "Look for a pattern in the differences between consecutive numbers.",  //level 32
    "Focus on how the numbers are combined in the equations.",  //level 33
    "Look for a pattern in the numbers in each row.",  //level 34
    "Focus on how the numbers are combined in the equations.",  //level 35
    "Focus on how the numbers are combined in the equations.",  //level 36
    "Focus on the relationship between the numbers in each equation.",  //level 37
    "Focus on how the numbers are combined in the equations.",  //level 38
    "Focus on how the numbers are combined in the equations.",  //level 39
    "Focus on the relationship between the numbers in each equation.",  //level 40
    "Look for a pattern in the numbers in each row.",  //level 41
    "Look at the image from a different perspective.",  //level 42
    "Look for a pattern in the differences between consecutive numbers.",  //level 43
    "Look for a pattern in the differences between consecutive numbers.",  //level 44
    "Focus on how the numbers are combined in the equations.",  //level 45
    "Focus on how the numbers are combined in the equations.",  //level 46
    "Focus on how the numbers are combined in the equations.",  //level 47
    "Focus on the relationship between the numbers in each equation.",  //level 48
    "Focus on the relationship between the numbers in each equation.",  //level 49
    "Focus on how the numbers are combined in the equations.",  //level 50
    "Look at the number of circles in each number.",  //level 51
    "Count the triangles systematically, starting from the smallest ones and working your way up to larger ones.",  //level 52
    "Look for a pattern in the numbers in each row and column.",  //level 53
    "Look for a pattern in the numbers in each row and column.",  //level 54
    "Focus on how the numbers are combined in the equations.",  //level 55
    "Focus on the relationship between the numbers inside and outside each triangle.",  //level 56
    "Focus on how the numbers are combined in the equations.",  //level 57
    "Focus on the relationship between the numbers in each equation.",  //level 58
    "Focus on the relationship between the numbers in each equation.",  //level 59
    "Look for a pattern in the numbers in each row and column.",  //level 60
    "Look for a pattern in the differences between consecutive numbers.",  //level 61
    "Look for a pattern in the differences between consecutive numbers.",  //level 62
    "Focus on how the numbers are combined in the equations.",  //level 63
    "Focus on the relationship between the numbers in each equation. Each number is multiplied by a consecutive number.",  //level 64
    "Focus on how the numbers are combined in the equations.",  //level 65
    "Look for a pattern in the numbers in each row and column.",  //level 66
    "Focus on the relationship between the numbers inside and outside each triangle.",  //level 67
    "Focus on how the numbers are combined in the equations.",  //level 68
    "Focus on how the numbers are combined in the equations.",  //level 69
    "Look for a pattern in the numbers on the right side of the equations.",  //level 70
    "Focus on how the numbers are combined in the equations.",  //level 71
    "Focus on how the numbers are combined in the equations.",  //level 72
    "Focus on how the numbers are combined in the equations. Each number is multiplied by a consecutive number.",  //level 73
    "Look for a pattern in the numbers in each row and column.",  //level 74
    "Count the letters in the number words.",  //level 75
  ];
  static List<String> write_Arrow=Preferences.getSkipLevels();
}