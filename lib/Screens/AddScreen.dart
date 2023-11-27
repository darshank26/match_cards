import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../utils/constants.dart';
import 'HomeScreens.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  var random_1 = Random();
  var random_2 = Random();

  var random_ans = Random();

  var n1, n2;
  var ans;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    n1 = random_1.nextInt(9).toString();
    n2 = random_2.nextInt(9).toString();

    setState(() {
      ans = random_ans.nextInt(4).toString();
    });

    print(ans.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kback,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 80,),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text("1/20",
                      style: GoogleFonts.akayaTelivigala(textStyle: TextStyle( height: 0.1,fontSize: 30,color: Colors.white70,fontWeight: FontWeight.w800,))
                  ),
                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Text(n1,
                      style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 180,color: Colors.white70,fontWeight: FontWeight.w900,))
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 150,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Text("+",
                    style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 150,color: Colors.white70,fontWeight: FontWeight.w900,))
                ),
              ),
              SizedBox(width: 20,),
              Center(
                child: Text(n2,
                    style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 180,color: Colors.white70,fontWeight: FontWeight.w900,))
                ),
              ),
            ],
          ),
          SizedBox(height: 100,),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white70,
                    border: Border.all(
                      color: Colors.white70,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                width: double.infinity,
                height: 20,
              ),
            )
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap : () {

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: kback),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.green.shade400,
                            child: Align(
                              alignment: Alignment.center,
                              child: ans == "0" ? Text('${(int.parse(n1) + int.parse(n2)).toString()}' ,
                                  style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,))
                              ) : Text('${(int.parse(n1) + random_1.nextInt(99)).toString()}' ,
                                  style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,))
                              ) ,
                            ),
                            maxRadius: 70,
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap : () {
                          Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: AddScreen(), childCurrent: HomeScreens()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.redAccent.shade200),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.redAccent.shade200,
                            child: Align(
                              alignment: Alignment.center,
                              child: ans == "1" ? Text('${(int.parse(n1) + int.parse(n2)).toString()}' ,
                                  style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,))
                              ) : Text('${(int.parse(n1) + random_2.nextInt(99)).toString()}' ,
                                  style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,))
                              ) ,
                            ),
                            maxRadius: 70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap : () {
                          Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: AddScreen(), childCurrent: HomeScreens()));
                        },
                        child: CircleAvatar(
                          backgroundColor: ksplashback,
                          child: Align(
                            alignment: Alignment.center,
                            child: ans == "2" ? Text('${(int.parse(n1) + int.parse(n2)).toString()}' ,
                                style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,))
                            ) : Text('${( random_1.nextInt(99) + int.parse(n2)).toString()}' ,
                                style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,))
                            ) ,
                          ),
                          maxRadius: 70,
                        ),
                      ),

                      GestureDetector(
                        onTap : () {
                          Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: AddScreen(), childCurrent: HomeScreens()));
                        },
                        child: CircleAvatar(
                          backgroundColor: ksplashback,
                          child: Align(
                            alignment: Alignment.center,
                            child: ans == "3" ? Text('${(int.parse(n1) + int.parse(n2)).toString()}' ,
                                style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,))
                            ) : Text('${( random_2.nextInt(99) + int.parse(n2)).toString()}' ,
                                style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,))
                            ) ,
                          ),
                          maxRadius: 70,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

        ],
      ),

    );
  }
}
