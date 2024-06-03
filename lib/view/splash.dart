import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final splashScreenProvider = Provider.of<SplashScreenProvider>(context);
    Future.delayed(Duration(seconds: 5), () {
      splashScreenProvider.setLoading(false);
    });

    return Scaffold(
      backgroundColor: Color(0xFF121481),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your splash screen content goes here
            if (splashScreenProvider.isLoading)
              Image.asset(
                "assets/daybyday.png",
                fit: BoxFit.cover,
                height: 250,
                width: 250,
              )
          ],
        ),
      ),
    );
  }
}
