import 'package:flutter/material.dart';
import 'package:newss/view/bottom_navigation.dart';
import 'package:newss/view/splash.dart';
import 'package:provider/provider.dart';
import 'controller/botton_nav_controller.dart';
import 'controller/category_controller.dart';
import 'controller/home_controller.dart';
import 'controller/search_screen_controller.dart';
import 'controller/splash_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SplashScreenProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => HomeScreenController(),
          ),
          ChangeNotifierProvider(
              create: (context)=>BottomNavController ()),
          ChangeNotifierProvider(create: (context)=>CategoryController()),
          ChangeNotifierProvider(
              create: (context)=>BottomNavController ()),
          ChangeNotifierProvider(create: (context)=>SearchScreenController()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Consumer<SplashScreenProvider>(
            builder: (context, splashScreenProvider, _) {
              return splashScreenProvider.isLoading
                  ? SplashScreen()
                  : BottomnavigationScreen(); // Replace with your home screen
            },
          ),
        ));
  }
}