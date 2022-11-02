import 'package:flutter/material.dart';
import 'package:weather_app/homeScreen.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()
      ,theme: ThemeData(primaryColor:Colors.blueAccent, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white)),)
  );
}
