import 'package:flutter/material.dart';

const Map<int, Color> primarySwatch = {
  50: Color.fromRGBO(255, 207, 68, .1),
  100: Color.fromRGBO(255, 207, 68, .2),
  200: Color.fromRGBO(255, 207, 68, .3),
  300: Color.fromRGBO(255, 207, 68, .4),
  400: Color.fromRGBO(255, 207, 68, .5),
  500: Color.fromRGBO(255, 207, 68, .6),
  600: Color.fromRGBO(255, 207, 68, .7),
  700: Color.fromRGBO(255, 207, 68, .8),
  800: Color.fromRGBO(255, 207, 68, .9),
  900: Color.fromRGBO(255, 207, 68, 1),
};

const MaterialColor primaryColor = MaterialColor(0xFFFFCF44, primarySwatch);
const int primaryColorDark = 0xFFFD9725;

const MaterialColor myColorPalette =
    MaterialColor(_myColorPalettePrimaryValue, <int, Color>{
  50: Color(0xFFFFF9E9),
  100: Color(0xFFFFF1C7),
  200: Color(0xFFFFE7A2),
  300: Color(0xFFFFDD7C),
  400: Color(0xFFFFD660),
  500: Color(_myColorPalettePrimaryValue),
  600: Color(0xFFFFCA3E),
  700: Color(0xFFFFC335),
  800: Color(0xFFFFBD2D),
  900: Color(0xFFFFB21F),
});
const int _myColorPalettePrimaryValue = 0xFFFFCF44;

const MaterialColor myColorPaletteAccent =
    MaterialColor(_myColorPaletteAccentValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(_myColorPaletteAccentValue),
  400: Color(0xFFFFEDCE),
  700: Color(0xFFFFE4B5),
});
const int _myColorPaletteAccentValue = 0xFFFFFFFF;



// const Map<int, Color> primarySwatch = {
//   50: Color.fromRGBO(255, 207, 68, .1),
//   100: Color.fromRGBO(255, 207, 68, .2),
//   200: Color.fromRGBO(255, 207, 68, .3),
//   300: Color.fromRGBO(255, 207, 68, .4),
//   400: Color.fromRGBO(255, 207, 68, .5),
//   500: Color.fromRGBO(255, 207, 68, .6),
//   600: Color.fromRGBO(255, 207, 68, .7),
//   700: Color.fromRGBO(255, 207, 68, .8),
//   800: Color.fromRGBO(255, 207, 68, .9),
//   900: Color.fromRGBO(255, 207, 68, 1),
// };

// const MaterialColor primaryColor = MaterialColor(0xFFFFCF44, primarySwatch);
// const int primaryColorDark = 0xFFFD9725;
