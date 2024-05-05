import 'package:flutter/material.dart';

navigateTo(context, Widget newScreen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => newScreen));
}

navigateWithReplacment(context, Widget newScreen) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => newScreen));
}

navigateAndRemoveUntil(context, Widget newScreen) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => newScreen), (route) => false);
}
