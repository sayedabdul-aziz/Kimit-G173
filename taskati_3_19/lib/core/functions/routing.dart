import 'package:flutter/material.dart';

navigateTo(context, Widget newScreen) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => newScreen,
  ));
}

navigateWithReplacment(context, Widget newScreen) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => newScreen,
  ));
}
