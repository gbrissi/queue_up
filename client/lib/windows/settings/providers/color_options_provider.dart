import 'package:flutter/material.dart';

const List<Color> defaultColors = [
  Colors.red,
  Colors.blue,
  Colors.indigo,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.pink,
  Colors.teal,
  Colors.cyan,
  Colors.lime,
  Colors.amber,
  Colors.brown,
  Colors.grey,
];

// class COConfig {
//   static late List<Color> availableColors;
//   static late List<Color>? prefsColors;
//   static bool isInit = false;

//   static Future<void> init() async {
//     prefsColor = await SharedPrefs.getSelectedColors();
//     availableColors = prefsColor ?? defaultColor;
//     isInit = true;
//   }
// }

// class ColorOptionsProvider with ChangeNotifier {
//   List<Color> _selectedColor = COConfig.selectedColor;

//   void setColor() {
//     _selectedColor = COConfig.selectedColor;
//     // TODO:
//     SharedPrefs.setThemeColor(_selectedColor);
//     notifyListeners();
//   }
// }
