import 'package:flutter/material.dart';

Future push(BuildContext context, Widget screen) {
  return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return screen;
  }));
}