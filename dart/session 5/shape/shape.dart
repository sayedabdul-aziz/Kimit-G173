// ignore_for_file: public_member_api_docs, sort_constructors_first

// abstract class
import 'dart:math';

abstract class Area {
  getArea(); // abstract method
}

abstract class Perimeter {
  getPerimeter(); // abstract method
}

class Circle implements Area, Perimeter {
  double d1;
  Circle({required this.d1});

  @override
  getArea() {
    print('Area : ${pi * d1 * d1}');
  }

  @override
  getPerimeter() {
    print('Perimeter : ${2 * pi * d1}');
  }
}

// class Rectangle extends Shape {
//   double d1;
//   double d2;
//   Rectangle({
//     required this.d1,
//     required this.d2,
//   });

//   @override
//   getArea() {
//     // (d1*d2)
//     print('Area : ${d1 * d2}');
//   }
// }
