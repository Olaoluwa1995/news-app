import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/constants/app-colors.dart';
import 'package:news_app/views/widgets/line.dart';

class AuthLayout extends StatelessWidget {
  AuthLayout({
    Key? key,
    required this.form,
    required this.text,
    required this.bottomRow,
    required this.title,
  }) : super(key: key);
  
  final Widget form;
  final String text;
  final Widget bottomRow;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/app_bg.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: size.height * 0.35,
                  padding: EdgeInsets.only(left: size.width * 0.1, top: size.height * 0.15),
                  child: Text('Welcome!!', style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),),
                ),
                Container(
                  height: size.height * 0.65,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                  ),
                  child: SingleChildScrollView(
                    // physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
                          child: Text(title, style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      form,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: size.height * 0.02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Line(),
                                Text(text, style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                )),
                                Line(),
                              ],
                            ),
                            SizedBox(
                                height: size.height * 0.02,
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/google.png', fit: BoxFit.cover, height: 35,),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                Image.asset('assets/facebook.png', fit: BoxFit.cover, height: 35),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            bottomRow,
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                          ],
                        ),
                      )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
