import 'package:flutter/material.dart';

class DiceDevice {
  static double getStatusBarHeight(context){
    return MediaQuery.of(context).padding.top;
  }
}