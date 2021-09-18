import 'package:flutter/material.dart';

const kInputTextFieldDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.blueAccent,
    prefixIcon: Icon(
      Icons.edit,
      color: Colors.white,
    ),
    hintText: 'ZCH',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none,
    ));
