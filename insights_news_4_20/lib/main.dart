import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insights_news_4_20/core/services/local_storage.dart';
import 'package:insights_news_4_20/core/utils/colors.dart';
import 'package:insights_news_4_20/core/utils/styles.dart';
import 'package:insights_news_4_20/features/manager/news_cubit.dart';
import 'package:insights_news_4_20/features/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalStorage().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.background,
            fontFamily: GoogleFonts.poppins().fontFamily,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.background,
              elevation: 0,
              centerTitle: true,
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: AppColors.background,
              // selectedItemColor: AppColors.primary,
              // unselectedItemColor: AppColors.grey,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              type: BottomNavigationBarType.fixed,
            ),
            inputDecorationTheme: InputDecorationTheme(
                prefixIconColor: AppColors.primary,
                filled: true,
                fillColor: AppColors.secondary,
                hintStyle: getSmallStyle(),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    borderSide: BorderSide.none))),
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
