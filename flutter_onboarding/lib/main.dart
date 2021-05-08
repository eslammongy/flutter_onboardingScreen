import 'package:flutter/material.dart';
import 'package:flutter_onboarding/screen/home_screen.dart';
import 'package:flutter_onboarding/screen/onboarding_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isFristRun;
  SharedPreferences sharedPreferences;

  saveFristRunValue(bool isFristRun) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("FristRun", isFristRun);
  }

  getFristRunValue() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      isFristRun = sharedPreferences.getBool("FristRun");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: Container(
          child: LayoutBuilder(
            builder: (context, constraints) => Container(
              color: Colors.deepPurpleAccent,
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Stack(children: [
                SplashScreen(
                    backgroundColor: Colors.deepPurple,
                    seconds: 3,
                    navigateAfterSeconds: OnBoardingScreen(),
                    useLoader: false),
                Container(
                  height: constraints.maxHeight * 0.8,
                  width: constraints.maxWidth,
                  child: SvgPicture.asset(
                    "assets/images/time_mangment.svg",
                  ),
                ),
                Align(
                    alignment: Alignment(0, 0.3),
                    child: Text(
                      "Mange Time",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontFamily: "Raleway"),
                      textAlign: TextAlign.center,
                    ))
              ]),
            ),
          ),
        ),
      ),
      routes: {"/home": (context) => HomeScreen()},
    );
  }
}
