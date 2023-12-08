import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:match_cards/Screens/HomeScreens.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';
import 'AddScreen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}




class _SettingScreenState extends State<SettingScreen> {

  var check_5 = true;
  var check_10 = true;
  var check_15 = true;
  var check_20 = true;
  var check_25 = true;
  var check_30 = true;
  var check_35 = true;
  var check_40 = true;
  var check_45 = true;
  var check_50 = true;

  var easy_check = true;
  var medium_check = true;
  var hard_check = true;

  final assetsAudioPlayer = AssetsAudioPlayer();

  late  SharedPreferences prefs;
  var currentNoQ = '5';
  var currentQMode = 'easy';


  String? getQData;
  String? getQMode;

   late bool soundMode ;

  bool? getSoundMode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getQNo();
    getQMo();
    getSMo();


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kback,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {

                      assetsAudioPlayer.open(
                        Audio("assets/audios/click.wav"),
                      );
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>HomeScreens())).then((_) {
                        setState(() {});
                      });
                      // Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios,size: 40,color: Colors.white60,),
                  ),
                ) ,
                Expanded(
                  flex: 3,
                  child: Text("Settings",
                      style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 50,color: Colors.white70,fontWeight: FontWeight.w800,letterSpacing: 0.5))
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Number of Questions",
                    style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 28,color: Colors.white70,fontWeight: FontWeight.w800,letterSpacing: 0.5))
                ),
              ],
            ),
            SizedBox(height: 20,),
            Column(
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

                          currentNoQ = '5';

                          saveNoQ(currentNoQ);

                          assetsAudioPlayer.open(
                            Audio("assets/audios/click.wav"),
                          );

                          setState(() {
                            if(check_5) {
                              check_5 = false;
                              check_10 = true;
                              check_15 = true;
                              check_20 = true;
                              check_25 = true;
                              check_30 = true;
                              check_35 = true;
                              check_40 = true;
                              check_45 = true;
                              check_50 = true;
                            }
                            else
                              {
                                check_5 = true;


                              }
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor:  check_5 ? ksplashback.withOpacity(0.4) : ksplashback,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("5",
                                style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 30,color: Colors.white70,fontWeight: FontWeight.w800,))
                            ),
                          ),
                          maxRadius: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap : () {
                          currentNoQ = '10';

                          saveNoQ(currentNoQ);

                          assetsAudioPlayer.open(
                            Audio("assets/audios/click.wav"),
                          );
                          setState(() {

                            if(check_10) {
                              check_10 = false;
                              check_5 = true;
                              check_15 = true;
                              check_20 = true;
                              check_25 = true;
                              check_30 = true;
                              check_35 = true;
                              check_40 = true;
                              check_45 = true;
                              check_50 = true;
                            }
                            else
                            {
                              print(getQData);

                              check_10 = true;


                            }
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: check_10 ? ksplashback.withOpacity(0.4) : ksplashback,
                          child: Text("10",
                              style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 30,color: Colors.white70,fontWeight: FontWeight.w800,))
                          ),
                          maxRadius: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap : () {
                          currentNoQ = '15';

                          saveNoQ(currentNoQ);
                          assetsAudioPlayer.open(
                            Audio("assets/audios/click.wav"),
                          );
                          setState(() {
                            if(check_15) {

                              check_15 = false;
                              check_10 = true;
                              check_5 = true;
                              check_20 = true;
                              check_25 = true;
                              check_30 = true;
                              check_35 = true;
                              check_40 = true;
                              check_45 = true;
                              check_50 = true;
                            }
                            else
                            {
                              check_15 = true;
                            }
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: check_15 ? ksplashback.withOpacity(0.4) : ksplashback,
                          child: Text("15",
                              style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 30,color: Colors.white70,fontWeight: FontWeight.w800,))
                          ),
                          maxRadius: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap : () {
                          currentNoQ = '20';

                          saveNoQ(currentNoQ);
                          assetsAudioPlayer.open(
                            Audio("assets/audios/click.wav"),
                          );
                          setState(() {
                            if(check_20) {
                              check_20 = false;
                              check_10 = true;
                              check_15 = true;
                              check_5 = true;
                              check_25 = true;
                              check_30 = true;
                              check_35 = true;
                              check_40 = true;
                              check_45 = true;
                              check_50 = true;
                            }
                            else
                            {
                              check_20 = true;
                            }
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: check_20 ? ksplashback.withOpacity(0.4) : ksplashback,
                          child: Text("20",
                              style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 30,color: Colors.white70,fontWeight: FontWeight.w800,))
                          ),
                          maxRadius: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap : () {
                          currentNoQ = '25';

                          saveNoQ(currentNoQ);
                          assetsAudioPlayer.open(
                            Audio("assets/audios/click.wav"),
                          );
                          setState(() {
                            if(check_25) {
                              check_25 = false;
                              check_10 = true;
                              check_15 = true;
                              check_20 = true;
                              check_5 = true;
                              check_30 = true;
                              check_35 = true;
                              check_40 = true;
                              check_45 = true;
                              check_50 = true;
                            }
                            else
                            {
                              check_25 = true;
                            }
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: check_25 ? ksplashback.withOpacity(0.4) : ksplashback,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("25",
                                style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 30,color: Colors.white70,fontWeight: FontWeight.w800,))
                            ),
                          ),
                          maxRadius: 30,
                        ),
                      ),


                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap : () {
                          currentNoQ = '30';

                          saveNoQ(currentNoQ);
                          assetsAudioPlayer.open(
                            Audio("assets/audios/click.wav"),
                          );
                          setState(() {
                            if(check_30) {
                              check_30 = false;
                              check_10 = true;
                              check_15 = true;
                              check_20 = true;
                              check_25 = true;
                              check_5 = true;
                              check_35 = true;
                              check_40 = true;
                              check_45 = true;
                              check_50 = true;
                            }
                            else
                            {
                              check_30 = true;
                            }
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: check_30 ? ksplashback.withOpacity(0.4) : ksplashback,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("30",
                                style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 30,color: Colors.white70,fontWeight: FontWeight.w800,))
                            ),
                          ),
                          maxRadius: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap : () {
                          currentNoQ = '35';

                          saveNoQ(currentNoQ);
                          assetsAudioPlayer.open(
                            Audio("assets/audios/click.wav"),
                          );
                          setState(() {
                            if(check_35) {
                              check_35 = false;
                              check_10 = true;
                              check_15 = true;
                              check_20 = true;
                              check_25 = true;
                              check_30 = true;
                              check_5 = true;
                              check_40 = true;
                              check_45 = true;
                              check_50 = true;
                            }
                            else
                            {
                              check_35 = true;
                            }
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: check_35 ? ksplashback.withOpacity(0.4) : ksplashback,
                          child: Text("35",
                              style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 30,color: Colors.white70,fontWeight: FontWeight.w800,))
                          ),
                          maxRadius: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap : () {
                          currentNoQ = '40';

                          saveNoQ(currentNoQ);
                          assetsAudioPlayer.open(
                            Audio("assets/audios/click.wav"),
                          );
                          setState(() {
                            if(check_40) {
                              check_40 = false;
                              check_10 = true;
                              check_15 = true;
                              check_20 = true;
                              check_25 = true;
                              check_30 = true;
                              check_35 = true;
                              check_5 = true;
                              check_45 = true;
                              check_50 = true;
                            }
                            else
                            {
                              check_40 = true;
                            }
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: check_40 ? ksplashback.withOpacity(0.4) : ksplashback,
                          child: Text("40",
                              style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 30,color: Colors.white70,fontWeight: FontWeight.w800,))
                          ),
                          maxRadius: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap : () {
                          currentNoQ = '45';

                          saveNoQ(currentNoQ);
                          assetsAudioPlayer.open(
                            Audio("assets/audios/click.wav"),
                          );
                          setState(() {
                            if(check_45) {
                              check_45 = false;
                              check_10 = true;
                              check_15 = true;
                              check_20 = true;
                              check_25 = true;
                              check_30 = true;
                              check_35 = true;
                              check_40 = true;
                              check_5 = true;
                              check_50 = true;
                            }
                            else
                            {
                              check_45 = true;
                            }
                          });

                        },
                        child: CircleAvatar(
                          backgroundColor: check_45 ? ksplashback.withOpacity(0.4) : ksplashback,
                          child: Text("45",
                              style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 30,color: Colors.white70,fontWeight: FontWeight.w800,))
                          ),
                          maxRadius: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap : () {
                          currentNoQ = '50';

                          saveNoQ(currentNoQ);
                          assetsAudioPlayer.open(
                            Audio("assets/audios/click.wav"),
                          );
                          setState(() {
                            if(check_50) {
                              check_50 = false;
                              check_10 = true;
                              check_15 = true;
                              check_20 = true;
                              check_25 = true;
                              check_30 = true;
                              check_35 = true;
                              check_40 = true;
                              check_45 = true;
                              check_5 = true;
                            }
                            else
                            {
                              check_50 = true;
                            }
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: check_50 ? ksplashback.withOpacity(0.4) : ksplashback,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("50",
                                style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 30,color: Colors.white70,fontWeight: FontWeight.w800,))
                            ),
                          ),
                          maxRadius: 30,
                        ),
                      ),


                    ],
                  ),
                ),

              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Question Mode",
                    style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 28,color: Colors.white70,fontWeight: FontWeight.w800,letterSpacing: 0.5))
                ),
              ],
            ),
            SizedBox(height: 20,),
            Column(
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
                          currentQMode = 'easy';

                          saveQMode(currentQMode);

                          assetsAudioPlayer.open(
                            Audio("assets/audios/click.wav"),
                          );

                          setState(() {
                            if(easy_check) {
                              easy_check = false;
                              medium_check = true;
                              hard_check = true;

                            }
                            else
                            {
                              easy_check = true;

                            }
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: easy_check ? ksplashback.withOpacity(0.4) : ksplashback,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Easy",
                                style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 22,color: Colors.white70,fontWeight: FontWeight.w900,))
                            ),
                          ),
                          maxRadius: 42,
                        ),
                      ),
                      GestureDetector(
                        onTap : () {
                          currentQMode = 'medium';

                          saveQMode(currentQMode);

                          assetsAudioPlayer.open(
                            Audio("assets/audios/click.wav"),
                          );
                          setState(() {
                            if(medium_check) {
                              medium_check = false;
                              easy_check = true;
                              hard_check = true;

                            }
                            else
                            {
                              medium_check = true;
                            }
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: medium_check ? ksplashback.withOpacity(0.4) : ksplashback,
                          child: Text("Medium",
                              style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 18,color: Colors.white70,fontWeight: FontWeight.w900,))
                          ),
                          maxRadius: 44,
                        ),
                      ),
                      GestureDetector(
                        onTap : () {
                          currentQMode = 'hard';

                          saveQMode(currentQMode);
                          assetsAudioPlayer.open(
                            Audio("assets/audios/click.wav"),
                          );
                          setState(() {
                            if(hard_check) {
                              hard_check = false;
                              easy_check = true;
                              medium_check = true;

                            }
                            else
                            {
                              hard_check = true;
                            }
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: hard_check ? ksplashback.withOpacity(0.4) : ksplashback,
                          child: Text("Hard",
                              style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 22,color: Colors.white70,fontWeight: FontWeight.w900,))
                          ),
                          maxRadius: 44,
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("More Actions",
                    style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 28,color: Colors.white70,fontWeight: FontWeight.w800,letterSpacing: 0.5))
                ),
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: ksplashback.withOpacity(0.4),
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                width: double.infinity,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left:15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sound",
                          style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 26,color: Colors.white70,fontWeight: FontWeight.w800,letterSpacing: 0.5))
                      ),
                      LiteRollingSwitch(
                        //initial value
                        value: soundMode,
                        textOn: 'On',
                        textOff: 'Off',
                        colorOn: ksplashback,
                        colorOff: kback,
                        iconOn: Icons.done,
                        iconOff: Icons.remove_circle_outline,
                        textSize: 20.0,
                        textOnColor: Colors.white70,
                        animationDuration: const Duration(milliseconds: 300),

                        onChanged: (bool state) {
                          //Use it to manage the different states

                          print('Current State of SWITCH IS: $state');
                          print(state.toString());

                          setState(() {

                            saveSMode(state);
                          });

                        },
                        onDoubleTap: () {},
                        onSwipe: () {},
                        onTap: () {

                          assetsAudioPlayer.open(
                            Audio("assets/audios/homeclick.wav"),
                          );
                        },
                      ),

                    ],
                  ),
                ),
              ),
            ),
            // SizedBox(height: 20,),
            // Padding(
            //   padding: const EdgeInsets.only(left:20.0,right: 20.0),
            //   child: GestureDetector(
            //     onTap: () {
            //
            //       showDialog(
            //         context: context,
            //         builder: (context) => AlertDialog(
            //           title: Container(
            //             width: 250,
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Text("Change Theme",
            //                     style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 26,color: Colors.black87,fontWeight: FontWeight.w800,letterSpacing: 0.5))
            //                 ),
            //                 // Icon(Icons.cancel_outlined,size: 30,),
            //                 SizedBox(height: 20,)
            //               ],
            //             ),
            //           ),
            //           content: ConstrainedBox(
            //             constraints: const BoxConstraints(maxHeight: 80),
            //
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               crossAxisAlignment: CrossAxisAlignment.stretch,
            //               children: [
            //                 Expanded(
            //                   child: Row(
            //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                     crossAxisAlignment: CrossAxisAlignment.stretch,                              children: [
            //                       GestureDetector(
            //                         onTap : () {
            //
            //                         },
            //                         child: CircleAvatar(
            //                           backgroundColor: kred,
            //                           maxRadius: 26,
            //                         ),
            //                       ),
            //                       SizedBox(width: 10,),
            //                       GestureDetector(
            //                         onTap : () {
            //
            //                         },
            //                         child: CircleAvatar(
            //                           backgroundColor: kblue,
            //                           maxRadius: 26,
            //                         ),
            //                       ),
            //                       SizedBox(width: 10,),
            //                       GestureDetector(
            //                         onTap : () {
            //
            //                         },
            //                         child: CircleAvatar(
            //                           backgroundColor:kblack,
            //                           maxRadius: 26,
            //                         ),
            //                       ),
            //                       SizedBox(width: 10,),
            //                       GestureDetector(
            //                         onTap : () {
            //
            //                         },
            //                         child: CircleAvatar(
            //                           backgroundColor: kpurple,
            //                           maxRadius: 26,
            //                         ),
            //                       ),
            //
            //                     ],
            //                   ),
            //                 ),
            //                 // Expanded(
            //                 //
            //                 //   child: Row(
            //                 //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 //     crossAxisAlignment: CrossAxisAlignment.stretch,                              children: [
            //                 //       GestureDetector(
            //                 //         onTap : () {
            //                 //
            //                 //         },
            //                 //         child: CircleAvatar(
            //                 //           backgroundColor: Colors.redAccent,
            //                 //           maxRadius: 26,
            //                 //         ),
            //                 //       ),
            //                 //       SizedBox(width: 10,),
            //                 //       GestureDetector(
            //                 //         onTap : () {
            //                 //
            //                 //         },
            //                 //         child: CircleAvatar(
            //                 //           backgroundColor: Colors.redAccent,
            //                 //           maxRadius: 26,
            //                 //         ),
            //                 //       ),
            //                 //       SizedBox(width: 10,),
            //                 //       GestureDetector(
            //                 //         onTap : () {
            //                 //
            //                 //         },
            //                 //         child: CircleAvatar(
            //                 //           backgroundColor: Colors.redAccent,
            //                 //           maxRadius: 26,
            //                 //         ),
            //                 //       ),
            //                 //       SizedBox(width: 10,),
            //                 //       GestureDetector(
            //                 //         onTap : () {
            //                 //
            //                 //         },
            //                 //         child: CircleAvatar(
            //                 //           backgroundColor: Colors.redAccent,
            //                 //           maxRadius: 26,
            //                 //         ),
            //                 //       ),
            //                 //
            //                 //     ],
            //                 //   ),
            //                 // ),
            //
            //               ],
            //             ),
            //           ),
            //
            //
            //
            //           actions: [
            //
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.end,
            //               children: [
            //                 ElevatedButton(
            //                   onPressed: () {
            //                     Navigator.pop(context);
            //                   },
            //                   child: Text('Cancel'),
            //                 ),
            //                 SizedBox(width: 10,),
            //                 ElevatedButton(
            //                   onPressed: () {
            //
            //
            //
            //                   },
            //                   child: Text('Ok'),
            //                 )
            //
            //               ],
            //             ),
            //
            //           ],
            //         ),
            //       );
            //       assetsAudioPlayer.open(
            //         Audio("assets/audios/click.wav"),
            //       );
            //     },
            //     child: Container(
            //       decoration: BoxDecoration(
            //           color: ksplashback.withOpacity(0.4),
            //           borderRadius: BorderRadius.all(Radius.circular(30))
            //       ),
            //       width: double.infinity,
            //       height: 40,
            //       child: Padding(
            //         padding: const EdgeInsets.only(left:15.0),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text("Change Theme",
            //                 style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 26,color: Colors.white70,fontWeight: FontWeight.w800,letterSpacing: 0.5))
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(right:18.0),
            //               child: Icon(Icons.format_paint,size: 30,color: Colors.white60,),
            //             ) ,
            //
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0),
              child: GestureDetector(
                onTap: () {

                  assetsAudioPlayer.open(
                    Audio("assets/audios/click.wav"),
                  );
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ksplashback.withOpacity(0.4),
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  width: double.infinity,
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(left:15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Share App",
                            style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 26,color: Colors.white70,fontWeight: FontWeight.w800,letterSpacing: 0.5))
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:18.0),
                          child: Icon(Icons.share,size: 30,color: Colors.white60,),
                        ) ,

                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0),
              child: GestureDetector(
                onTap: () {
                  assetsAudioPlayer.open(
                    Audio("assets/audios/click.wav"),
                  );

                  launchPlay();

                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ksplashback.withOpacity(0.4),
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  width: double.infinity,
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(left:15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rate Us",
                            style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 26,color: Colors.white70,fontWeight: FontWeight.w800,letterSpacing: 0.5))
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:18.0),
                          child: Icon(Icons.star_rate_outlined,size: 30,color: Colors.white60,),
                        ) ,

                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.0),
              child: GestureDetector(
                onTap: () {
                  assetsAudioPlayer.open(
                    Audio("assets/audios/click.wav"),
                  );
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ksplashback.withOpacity(0.4),
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  width: double.infinity,
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(left:15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Remove Ads",
                            style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 26,color: Colors.white70,fontWeight: FontWeight.w800,letterSpacing: 0.5))
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:18.0),
                          child: Icon(Icons.lock,size: 30,color: Colors.white60,),
                        ) ,

                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),

          ],
        ),
      ),
    );

  }

  Future<void> saveNoQ(String s) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(s == '5')
      {
        await prefs.setString('NoOfQ', '5');
      }
    else if(s == '10')
      {
        await prefs.setString('NoOfQ', '10');
      }
    else if(s == '15')
    {
      await prefs.setString('NoOfQ', '15');
    }
    else if(s == '20')
    {
      await prefs.setString('NoOfQ', '20');
    }
    else if(s == '25')
    {
      await prefs.setString('NoOfQ', '25');
    }
    else if(s == '30')
    {
      await prefs.setString('NoOfQ', '30');
    }
    else if(s == '35')
    {
      await prefs.setString('NoOfQ', '35');
    }
    else if(s == '40')
    {
      await prefs.setString('NoOfQ', '40');
    }
    else if(s == '45')
    {
      await prefs.setString('NoOfQ', '45');
    }
    else if(s == '50')
    {
      await prefs.setString('NoOfQ', '50');
    }


  }

  Future<void> getQNo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      getQData = prefs.getString('NoOfQ');
    });

    if(getQData == '5')
      {
        check_5 = false;
      }
    else if(getQData == '10')
      {
        check_10 = false;
      }
    else if(getQData == '15')
    {
      check_15 = false;
    } else if(getQData == '20')
    {
      check_20 = false;
    }
    else if(getQData == '25')
    {
      check_25 = false;
    } else if(getQData == '30')
    {
      check_30 = false;
    }
    else if(getQData == '35')
    {
      check_35 = false;
    } else if(getQData == '40')
    {
      check_40 = false;
    }
    else if(getQData == '45')
    {
      check_45 = false;
    }
    else if(getQData == '50')
    {
      check_50 = false;
    }
    print(getQData);
  }

  Future<void> saveQMode(String currentQMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(currentQMode == 'easy')
    {
      await prefs.setString('QMode', 'easy');
    }
    else if(currentQMode == 'medium')
    {
      await prefs.setString('QMode', 'medium');
    }
    else if(currentQMode == 'hard')
    {
      await prefs.setString('QMode', 'hard');
    }

  }

  Future<void> saveSMode(bool currentSMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('SMode', currentSMode);

    setState(() {

    });

  }

  Future<void> getSMo() async {


    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

      getSoundMode = prefs.getBool('SMode');

      print("------${getSoundMode.toString()}");

      if (getSoundMode!) {
        soundMode = true;
      }
      else {
        soundMode = false;

      }
    });


  }

  Future<void> getQMo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      getQMode = prefs.getString('QMode');
    });

    if (getQMode == 'easy') {
      easy_check = false;
    }
    else if (getQMode == 'medium') {
      medium_check = false;
    }
    else if (getQMode == 'hard') {
      hard_check = false;
    }
  }

}





