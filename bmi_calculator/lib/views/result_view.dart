import 'package:bmi_calculator/core/colors.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key, required this.res});
  final double res;

  String getClassification() {
    if (res < 16) {
      return 'Severe Thinness';
    } else if (res >= 18.5 && res <= 25) {
      return 'Normal';
    } else {
      return 'Obese Class III';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getClassification(),
              style: TextStyle(
                fontSize: 30,
                color: AppColors.green,
              ),
            ),
            Text(
              res.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 30,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
