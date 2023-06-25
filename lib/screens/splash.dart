import 'dart:async';
import 'package:flutter/material.dart';
import 'createAccount1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          color: Color(0xff0F9BA1),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Image.asset('assets/images/dummy-logo.png', width: 125, height: 125),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Oliver's Mobile App\n",
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontFamily: "Inter",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        height: 1.6),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Powered By Oliver's Technology",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontFamily: "Inter",
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
              ),
            ],
          ),
        ));
  }
}
