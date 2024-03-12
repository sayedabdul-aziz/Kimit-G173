import 'package:bmi_calculator/core/colors.dart';
import 'package:bmi_calculator/views/result_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int age = 22;
  int weight = 60;
  int height = 150;
  bool isMale = true;

  // if(condition){
  //
  // }else{

  // }

  //Color aksjdh =  (condition)?AppColors.:AppC;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: Text(
          'Bmi Calculator',
          style: TextStyle(fontSize: 18, color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            //male and female
            Expanded(
              child: Row(
                children: [
                  // male
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: isMale
                                ? AppColors.primary
                                : AppColors.containerBg,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male_rounded,
                                color: AppColors.white,
                                size: 80,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'male',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  //female
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: isMale
                                ? AppColors.containerBg
                                : AppColors.primary,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female,
                                color: AppColors.white,
                                size: 80,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'Female',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //height
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.containerBg),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: TextStyle(color: AppColors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '$height',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'CM',
                            style: TextStyle(color: AppColors.white),
                          ),
                        ],
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 90,
                        max: 220,
                        activeColor: AppColors.primary,
                        inactiveColor: AppColors.buttonColor,
                        onChanged: (value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            // age and weight
            Expanded(
              child: Row(
                children: [
                  // weight
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.containerBg,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Weight',
                              style: TextStyle(color: AppColors.white),
                            ),
                            Text(
                              '$weight',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    style: IconButton.styleFrom(
                                      backgroundColor: AppColors.buttonColor,
                                      foregroundColor: AppColors.white,
                                    ),
                                    onPressed: () {
                                      if (weight > 30) {
                                        setState(() {
                                          weight--;
                                        });
                                      }
                                    },
                                    icon: const Icon(Icons.remove)),
                                IconButton(
                                    style: IconButton.styleFrom(
                                      backgroundColor: AppColors.buttonColor,
                                      foregroundColor: AppColors.white,
                                    ),
                                    onPressed: () {
                                      if (weight < 120) {
                                        setState(() {
                                          weight++;
                                        });
                                      }
                                    },
                                    icon: const Icon(Icons.add))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  //age
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.containerBg,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Age',
                              style: TextStyle(color: AppColors.white),
                            ),
                            Text(
                              '$age',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    style: IconButton.styleFrom(
                                      backgroundColor: AppColors.buttonColor,
                                      foregroundColor: AppColors.white,
                                    ),
                                    onPressed: () {
                                      // min
                                      if (age > 12) {
                                        setState(() {
                                          age--;
                                        });
                                      }
                                    },
                                    icon: const Icon(Icons.remove)),
                                IconButton(
                                    style: IconButton.styleFrom(
                                      backgroundColor: AppColors.buttonColor,
                                      foregroundColor: AppColors.white,
                                    ),
                                    onPressed: () {
                                      // max
                                      if (age < 90) {
                                        setState(() {
                                          age++;
                                        });
                                      }
                                    },
                                    icon: const Icon(Icons.add))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // calculate
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  // BMI = 	mass (kg)/height2 (m)

                  double res = weight / ((height / 100) * (height / 100));

                  // navigate to a new screen
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ResultView(res: res,),
                  ));
                },
                child: const Text('CALCULATE'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
