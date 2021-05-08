import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_onboarding/model/onboarding_data.dart';
import 'package:flutter_onboarding/widgets/indicator_container.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  List<OnBoardingItem> onBoardingItem = [
    OnBoardingItem(
        title: "Eating",
        desc:
            "When you are overwhelmed by the amount of the work you have on your plate , stop and rethink",
        imageUrl: "assets/images/undraw_Hamburg.svg"),
    OnBoardingItem(
        title: "Coding",
        desc:
            "When you are overwhelmed by the amount of the work you have on your plate , stop and rethink",
        imageUrl: "assets/images/undraw_dev_productivity_umsq.svg"),
    OnBoardingItem(
        title: "Sporting",
        desc:
            "When you are overwhelmed by the amount of the work you have on your plate , stop and rethink",
        imageUrl: "assets/images/sporting.svg"),
    OnBoardingItem(
        title: "Sleeping",
        desc:
            "When you are overwhelmed by the amount of the work you have on your plate , stop and rethink",
        imageUrl: "assets/images/sleeping.svg"),
  ];

  // @override
  // void initState() {
  //   Timer.periodic(Duration(seconds: 5), (timer) {
  //     if (currentIndex < 3) currentIndex++;
  //     pageController.animateToPage(currentIndex,
  //         duration: Duration(microseconds: 300), curve: Curves.easeIn);
  //   });

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff5E5E5E),
      backgroundColor: Colors.deepPurpleAccent,
      body: Container(
        child: LayoutBuilder(
          builder: (context, constraints) => Stack(children: [
            PageView(
              controller: pageController,
              children: onBoardingItem
                  .map((item) => Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              item.imageUrl,
                              height: constraints.maxHeight * 0.4,
                              width: constraints.maxWidth,
                            ),
                            Text(
                              item.title,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item.desc,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ))
                  .toList(),
              onPageChanged: (currentPage) {
                setState(() {
                  currentIndex = currentPage;
                  if (currentIndex == 3) {
                    Future.delayed(
                        Duration(seconds: 5),
                        () => Navigator.of(context)
                            .pushReplacementNamed("/home"));
                  }
                });
              },
            ),
            IndicatorCircle(currentIndex),
            Align(
              alignment: Alignment(0.1, 0.9),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: RaisedButton(
                  padding: EdgeInsets.all(15),
                  color: Colors.deepOrange,
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("/home");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "G0",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
