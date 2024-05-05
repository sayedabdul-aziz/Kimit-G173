import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/features/movie/presentation/manager/movie_cubit.dart';
import 'package:movie_app/features/movie/presentation/views/movie_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scrollbarTheme: ScrollbarThemeData(
                thumbColor: MaterialStatePropertyAll(AppColors.primary),
                radius: const Radius.circular(30)),
            scaffoldBackgroundColor: AppColors.darkScaffoldbg,
            appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: AppColors.darkScaffoldbg,
              foregroundColor: AppColors.primary,
            )),
        home: const MovieView(),
      ),
    );
  }
}
