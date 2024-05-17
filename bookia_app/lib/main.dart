import 'package:bookia_app/core/constants/constants.dart';
import 'package:bookia_app/core/services/api_services.dart';
import 'package:bookia_app/core/services/local_services.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/nav_bar_widget.dart';
import 'package:bookia_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:bookia_app/features/home/presentation/manager/home_cubit.dart';
import 'package:bookia_app/features/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalStorage().init();
  await ApiServices().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: GoogleFonts.dmSerifDisplay().fontFamily,
            appBarTheme: const AppBarTheme(
              centerTitle: true,
            ),
            inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: AppColors.secondaryColor,
                hintStyle: getbodyStyle(color: AppColors.grey),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.grey),
                    borderRadius: BorderRadius.circular(8)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.grey),
                    borderRadius: BorderRadius.circular(8)))),
        // CHECK IF USER IS LOGGED IN OR NOT
        home: AppLocalStorage.getCachedData(ktoken) == null
            ? const WelcomeView()
            : const NavBarWidget(),
      ),
    );
  }
}
