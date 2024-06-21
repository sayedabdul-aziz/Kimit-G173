import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se7ety_5_28/core/functions/routing.dart';
import 'package:se7ety_5_28/core/services/local_services.dart';
import 'package:se7ety_5_28/features/doctor/home/home_page.dart';
import 'package:se7ety_5_28/features/intro/presentation/onboarding/onboarding_view.dart';
import 'package:se7ety_5_28/features/intro/welcome_view.dart';
import 'package:se7ety_5_28/features/patient/nav_bar.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      pushToWithReplacement(context, const OnboardingView());

      // todo: check if user is logged in
      // Todo: check this user is a doctor or patient
      // todo: using firebase firestore
      // todo: using cacheing
      // Todo: if onboarding is not done, ==> onboarding view
      // Todo: else ==> welcome View

      pushToWithReplacement(
          context,
          FirebaseAuth.instance.currentUser != null
              ? FirebaseAuth.instance.currentUser?.photoURL == '0'
                  ? const DoctorHomeView() //Update with doctor nav
                  : const PatientNavBar()
              // --------
              : AppLocalStorage.getData('isOnboarding') ?? false
                  ? const WelcomeView()
                  : const OnboardingView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 250,
        ),
      ),
    );
  }
}
