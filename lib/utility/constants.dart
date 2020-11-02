import 'package:flutter/material.dart';

final Color kRoyalBlue = Color(0xFF0433bf);
final Color kGreen = Color(0xFF48d552);
final Color kClickableLink = Color(0xFF1c7bfd);
final Color kTitleText = Color(0xFF000000);
final Color kSubText = Color(0xFFb6bbc9);
final Color kUpvote = Color(0xFF48e53d);
final Color kDownvote = Color(0xFFff5e5e);
final Color kPastelBlue = Color(0xFFd8e7ff);
final Color kBackground = Color(0xFFf4f8f9);
final Color kProgresBGBlue = Color(0xFFbadfff);
final Color kProgressBlue = Color(0xff95ceff);
final Color kProgresBGGreen = Color(0xFFd5fff3);
final Color kProgressGreen = Color(0xff82e5c8);

var kTextFieldDecoration = InputDecoration(
    hintText: '',
    labelStyle: TextStyle(color: Colors.black),
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFb6bbc9), width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFb6bbc9), width: 3.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    counterText: '');

TextStyle ktext =
    TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);
