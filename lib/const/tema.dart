import 'package:flutter/material.dart';

class Tema {
  inputDec(String hintext,IconData icon){
    return InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white,
      ), // Icon
      hintText: hintext,
      prefixText: '',
      hintStyle: TextStyle(
        color: Colors.white,
      ),
      focusColor: Colors.white, // TextStyle
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          )), // BorderSide, UnderlineInputBorder
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          )), // BorderSide, UnderlineInputBorder
    );
  }
}
