import 'package:flutter/material.dart';

const textInputDecoration =  InputDecoration(
  //hintText: 'Email',
  filled: true,
  fillColor: Colors.white,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
  ),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0),         
    ),
  );