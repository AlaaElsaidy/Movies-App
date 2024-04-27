import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/routing/appRouting.dart';
import 'package:movies/config/theming/appTheming.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,

      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
       debugShowCheckedModeBanner: false,
        theme: AppTheming.lightTheme,
        onGenerateRoute: (settings) => AppRouter.onGenerate(settings),
      ),
    );
  }
}