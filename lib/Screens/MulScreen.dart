import 'dart:async';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:match_cards/Screens/ResultScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xrandom/xrandom.dart';

import '../utils/constants.dart';
import 'HomeScreens.dart';

class MulScreen extends StatefulWidget {
  const MulScreen({Key? key}) : super(key: key);

  @override
  State<MulScreen> createState() => _MulScreenState();
}

class _MulScreenState extends State<MulScreen> {

  var random_1 = Random();
  var random_2 = Random();
  final xrandom_1 = Xrandom();

  var random_ans = Random();

  var n1;
  var n2;
  var rand_1;
  var rand_2;
  var rand_3;
  var rand_4;

  var ans;
  var getQData;
  var _checkCounter = 1;
  var _countCorrect = 0;
  var _countWorng = 0;
  String? getQMode;

  bool _countWrong_0 = false;
  bool _countWrong_1 = false;
  bool _countWrong_2 = false;
  bool _countWrong_3 = false;

  final assetsAudioPlayer = AssetsAudioPlayer();
  final shakeKey_0 = GlobalKey<ShakeWidgetState>();
  final shakeKey_1 = GlobalKey<ShakeWidgetState>();
  final shakeKey_2 = GlobalKey<ShakeWidgetState>();
  final shakeKey_3 = GlobalKey<ShakeWidgetState>();

  late Timer _timer;
  int _seconds = 0;
  bool _timerRunning = false;


  late bool soundMode ;

  late bool getSoundMode;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      _seconds++;
    });
  }

  void stopTimer() {
    _timer.cancel();
    setState(() {
      _timerRunning = false;
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQNo();
    getQMo();
    getSMo();

    if (_timerRunning) {
      stopTimer();
    } else {
      startTimer();
      setState(() {
        _timerRunning = true;
      });
    }

    setState(() {
      ans = random_ans.nextInt(4).toString();
    });

    print(ans.toString());



  }


  Future<void> getSMo() async {


    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {

      getSoundMode = prefs.getBool('SMode')!;

      print("------${getSoundMode.toString()}");

      if (getSoundMode!) {
        soundMode = true;
      }
      else {
        soundMode = false;

      }
    });


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
                  child: Text("${_checkCounter}/${getQData}",
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
                  child:
                  getQMode == 'hard' ?
                  Text(n1,
                      style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 120,color: Colors.white70,fontWeight: FontWeight.w900,))
                  ) :
                  Text(n1,
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
                child:
                getQMode == 'hard' ?

                Text("x",
                    style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 120,color: Colors.white70,fontWeight: FontWeight.w900,))
                ) :
                Text("x",
                    style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 150,color: Colors.white70,fontWeight: FontWeight.w900,))
                ),
              ),
              SizedBox(width: 20,),
              Center(
                child:
                getQMode == 'hard' ?
                Text(n2,
                    style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 120,color: Colors.white70,fontWeight: FontWeight.w900,))
                ) :
                Text(n2,
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

                          if(ans == "0")
                          {
                          if(getSoundMode) {
                            assetsAudioPlayer.open(
                              Audio("assets/audios/correct.wav"),
                            );
                          }

                            _countCorrect = _countCorrect + 1;
                            print(_countCorrect);


                            if(_checkCounter == int.parse(getQData))
                            {
                              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.topToBottom, child: ResultScreen(_countCorrect.toString(),_countWorng.toString(),getQData.toString(),formatTime(_seconds)), childCurrent: MulScreen()));
                            }
                            else
                            {
                              getNewData();
                              updateCounter();
                            }

                          }
                          else
                          {
                            if(_countWrong_0 == false)
                            {
                              _countWorng = _countWorng + 1;

                              _countWrong_0 = true;
                              _countWrong_1 = true;
                              _countWrong_2 = true;
                              _countWrong_3 = true;


                            }
                            shakeKey_0.currentState?.shake();


                            if(getSoundMode) {
                              assetsAudioPlayer.open(
                                Audio("assets/audios/wrong.wav"),
                              );
                            }
                          }

                        },
                        child: ShakeMe(
                          key: shakeKey_0,
                          // 5. configure the animation parameters
                          shakeCount: 3,
                          shakeOffset: 10,
                          child: CircleAvatar(
                            backgroundColor: ksplashback,
                            maxRadius: 70,
                            child: Align(
                              alignment: Alignment.center,
                              child: ans == "0" ? Text('${(int.parse(n1) * int.parse(n2)).toString()}' ,
                                  style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,))
                              ) :(
                                  (getQMode == 'easy')
                                      ? Text('${(int.parse(rand_1)).toString()}' ,
                                      style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,)))
                                      : (
                                      (getQMode == 'medium')
                                          ? Text('${(int.parse(rand_1)).toString()}' ,
                                          style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,)))
                                          : Text('${(int.parse(rand_1)).toString()}' ,
                                          style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,)))
                                  )),
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap : () {


                          if(ans == "1")
                          {
                            if(getSoundMode) {
                              assetsAudioPlayer.open(
                                Audio("assets/audios/correct.wav"),
                              );
                            }

                            _countCorrect = _countCorrect + 1;
                            print(_countCorrect);


                            if(_checkCounter == int.parse(getQData))
                            {
                              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.topToBottom, child: ResultScreen(_countCorrect.toString(),_countWorng.toString(),getQData.toString(),formatTime(_seconds)), childCurrent: MulScreen()));
                            }
                            else
                            {
                              getNewData();
                              updateCounter();
                            }


                          }
                          else
                          {
                            if(_countWrong_1 == false)
                            {
                              _countWorng = _countWorng + 1;
                              _countWrong_0 = true;
                              _countWrong_1 = true;
                              _countWrong_2 = true;
                              _countWrong_3 = true;                                }

                            shakeKey_1.currentState?.shake();

                            if(getSoundMode) {
                              assetsAudioPlayer.open(
                                Audio("assets/audios/wrong.wav"),
                              );
                            }

                          }

                        },
                        child: ShakeMe(
                          key: shakeKey_1,
                          // 5. configure the animation parameters
                          shakeCount: 3,
                          shakeOffset: 10,
                          child: CircleAvatar(
                            backgroundColor: ksplashback,
                            child: Align(
                              alignment: Alignment.center,
                              child: ans == "1" ? Text('${(int.parse(n1) * int.parse(n2)).toString()}' ,
                                  style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,))
                              ) :(
                                  (getQMode == 'easy')
                                      ? Text('${(int.parse(rand_2)).toString()}' ,
                                      style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,)))
                                      : (
                                      (getQMode == 'medium')
                                          ? Text('${(int.parse(rand_2)).toString()}' ,
                                          style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,)))
                                          : Text('${(int.parse(rand_2).toString())}' ,
                                          style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,)))
                                  )),
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

                          if(ans == "2")
                          {
                          if(getSoundMode) {
                            assetsAudioPlayer.open(
                              Audio("assets/audios/correct.wav"),
                            );
                          }

                            _countCorrect = _countCorrect + 1;

                            print(_countCorrect);



                            if(_checkCounter == int.parse(getQData))
                            {
                              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.topToBottom, child: ResultScreen(_countCorrect.toString(),_countWorng.toString(),getQData.toString(),formatTime(_seconds)), childCurrent: MulScreen()));
                            }
                            else
                            {
                              getNewData();
                              updateCounter();
                            }

                          }
                          else
                          {

                            if(_countWrong_2 == false)
                            {
                              _countWorng = _countWorng + 1;
                              _countWrong_0 = true;
                              _countWrong_1 = true;
                              _countWrong_2 = true;
                              _countWrong_3 = true;                                }
                            shakeKey_2.currentState?.shake();

                            if(getSoundMode) {
                              assetsAudioPlayer.open(
                                Audio("assets/audios/wrong.wav"),
                              );
                            }
                          }

                        },
                        child: ShakeMe(
                          key: shakeKey_2,
                          shakeCount: 3,
                          shakeOffset: 10,
                          child: CircleAvatar(
                            backgroundColor: ksplashback,
                            child: Align(
                              alignment: Alignment.center,
                              child: ans == "2" ? Text('${(int.parse(n1) * int.parse(n2)).toString()}' ,
                                  style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,))
                              ) :(
                                  (getQMode == 'easy')
                                      ? Text('${(int.parse(rand_3)).toString()}' ,
                                      style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,)))
                                      : (
                                      (getQMode == 'medium')
                                          ? Text('${(int.parse(rand_3)).toString()}' ,
                                          style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,)))
                                          : Text('${(int.parse(rand_3)).toString()}' ,
                                          style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,)))
                                  )),
                            ),
                            maxRadius: 70,
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap : () {


                          if(ans == "3")
                          {
                            if(getSoundMode) {
                              assetsAudioPlayer.open(
                                Audio("assets/audios/correct.wav"),
                              );
                            }

                            _countCorrect = _countCorrect + 1;
                            print(_countCorrect);



                            if(_checkCounter == int.parse(getQData))
                            {
                              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.topToBottom, child: ResultScreen(_countCorrect.toString(),_countWorng.toString(),getQData.toString(),formatTime(_seconds)), childCurrent: MulScreen()));
                            }
                            else
                            {
                              getNewData();
                              updateCounter();
                            }


                          }else
                          {
                            if(_countWrong_3 == false) {
                              _countWorng = _countWorng + 1;
                              _countWrong_0 = true;
                              _countWrong_1 = true;
                              _countWrong_2 = true;
                              _countWrong_3 = true;
                            }
                            shakeKey_3.currentState?.shake();

                            if(getSoundMode) {
                              assetsAudioPlayer.open(
                                Audio("assets/audios/wrong.wav"),
                              );
                            }

                          }


                        },
                        child: ShakeMe(
                          key: shakeKey_3,
                          shakeCount: 3,
                          shakeOffset: 10,
                          child: CircleAvatar(
                            backgroundColor: ksplashback,
                            child: Align(
                              alignment: Alignment.center,
                              child: ans == "3" ? Text('${(int.parse(n1) * int.parse(n2)).toString()}' ,
                                  style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,))
                              ) :(
                                  (getQMode == 'easy')
                                      ? Text('${(int.parse(rand_4)).toString()}' ,
                                      style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,)))
                                      : (
                                      (getQMode == 'medium')
                                          ? Text('${(int.parse(rand_4)).toString()}' ,
                                          style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,)))
                                          : Text('${(int.parse(rand_4).toString())}' ,
                                          style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle( height: 0.1,fontSize: 46,color: Colors.white70,fontWeight: FontWeight.w900,)))
                                  )),
                            ),
                            maxRadius: 70,
                          ),
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
  Future<void> getQNo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      getQData = prefs.getString('NoOfQ');
    });

  }

  Future<void> getQMo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      getQMode = prefs.getString('QMode');
    });

    setState(() {
      if(getQMode == 'easy')
      {


        List<int> _randomValue10 = [0, 1, 2, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]..shuffle();


        n1 = _randomValue10[4].toString();
        n2 =_randomValue10[5].toString();

        rand_1 = _randomValue10[0].toString();
        rand_2 = _randomValue10[1].toString();
        rand_3 = _randomValue10[2].toString();
        rand_4 = _randomValue10[3].toString();

        if(
        (rand_1 == (int.parse(n1) * int.parse(n2)).toString())  ||
            (rand_2 == (int.parse(n1) * int.parse(n2)).toString())  ||
            (rand_3 == (int.parse(n1) * int.parse(n2)).toString())  ||
            (rand_4 == (int.parse(n1) * int.parse(n2)).toString()))
        {

          setState(() {
            List<int> _randomValue10 = [0, 1, 2, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]..shuffle();

            n1 = _randomValue10[4].toString();
            n2 =_randomValue10[5].toString();
          });
        }

      }
      else if(getQMode == 'medium')
      {
        List<int> randomValue100 = List<int>.generate(51, (index) => index)
          ..shuffle(Random());

        n1 = randomValue100[4].toString();
        n2 =randomValue100[5].toString();

        rand_1 = randomValue100[0].toString();
        rand_2 = randomValue100[1].toString();
        rand_3 = randomValue100[2].toString();
        rand_4 = randomValue100[3].toString();

        if(
        (rand_1 == (int.parse(n1) * int.parse(n2)).toString())  ||
            (rand_2 == (int.parse(n1) * int.parse(n2)).toString())  ||
            (rand_3 == (int.parse(n1) * int.parse(n2)).toString())  ||
            (rand_4 == (int.parse(n1) * int.parse(n2)).toString()))
        {

          setState(() {
            List<int> randomValue100 = List<int>.generate(51, (index) => index)
              ..shuffle(Random());

            n1 = randomValue100[4].toString();
            n2 =randomValue100[5].toString();
          });
        }



      }
      else if(getQMode == 'hard')
      {

        List<int> randomValue1001 = List<int>.generate(101, (index) => index)
          ..shuffle(Random());

        n1 = randomValue1001[4].toString();
        n2 =randomValue1001[5].toString();

        rand_1 = randomValue1001[0].toString();
        rand_2 = randomValue1001[1].toString();
        rand_3 = randomValue1001[2].toString();
        rand_4 = randomValue1001[3].toString();

        if(
        (rand_1 == (int.parse(n1) * int.parse(n2)).toString())  ||
            (rand_2 == (int.parse(n1) * int.parse(n2)).toString())  ||
            (rand_3 == (int.parse(n1) * int.parse(n2)).toString())  ||
            (rand_4 == (int.parse(n1) * int.parse(n2)).toString()))
        {

          setState(() {
            List<int> randomValue1001 = List<int>.generate(101, (index) => index)
              ..shuffle(Random());

            n1 = randomValue1001[4].toString();
            n2 =randomValue1001[5].toString();
          });
        }





      }

    });

  }

  void getNewData() {

    setState(() {


      if(getQMode == 'easy')
      {


        List<int> _randomValue10 = [0, 1, 2, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]..shuffle();




        n1 = _randomValue10[4].toString();
        n2 =_randomValue10[5].toString();

        rand_1 = _randomValue10[0].toString();
        rand_2 = _randomValue10[1].toString();
        rand_3 = _randomValue10[2].toString();
        rand_4 = _randomValue10[3].toString();

        if(
        (rand_1 == (int.parse(n1) * int.parse(n2)).toString())  ||
            (rand_2 == (int.parse(n1) * int.parse(n2)).toString())  ||
            (rand_3 == (int.parse(n1) * int.parse(n2)).toString())  ||
            (rand_4 == (int.parse(n1) * int.parse(n2)).toString()))
        {

          setState(() {
            List<int> _randomValue10 = [0, 1, 2, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]..shuffle();

            n1 = _randomValue10[4].toString();
            n2 =_randomValue10[5].toString();
          });
        }

      }
      else if(getQMode == 'medium')
      {
        List<int> randomValue100 = List<int>.generate(51, (index) => index)
          ..shuffle(Random());

        n1 = randomValue100[4].toString();
        n2 =randomValue100[5].toString();

        rand_1 = randomValue100[0].toString();
        rand_2 = randomValue100[1].toString();
        rand_3 = randomValue100[2].toString();
        rand_4 = randomValue100[3].toString();

        if(
        (rand_1 == (int.parse(n1) * int.parse(n2)).toString())  ||
            (rand_2 == (int.parse(n1) * int.parse(n2)).toString())  ||
            (rand_3 == (int.parse(n1) * int.parse(n2)).toString())  ||
            (rand_4 == (int.parse(n1) * int.parse(n2)).toString()))
        {

          setState(() {
            List<int> randomValue100 = List<int>.generate(51, (index) => index)
              ..shuffle(Random());

            n1 = randomValue100[4].toString();
            n2 =randomValue100[5].toString();
          });
        }



      }
      else if(getQMode == 'hard')
      {

        List<int> randomValue1001 = List<int>.generate(101, (index) => index)
          ..shuffle(Random());

        n1 = randomValue1001[4].toString();
        n2 =randomValue1001[5].toString();

        rand_1 = randomValue1001[0].toString();
        rand_2 = randomValue1001[1].toString();
        rand_3 = randomValue1001[2].toString();
        rand_4 = randomValue1001[3].toString();

        if(
        (rand_1 == (int.parse(n1) * int.parse(n2)).toString())  ||
            (rand_2 == (int.parse(n1) * int.parse(n2)).toString())  ||
            (rand_3 == (int.parse(n1) * int.parse(n2)).toString())  ||
            (rand_4 == (int.parse(n1) * int.parse(n2)).toString()))
        {

          setState(() {
            List<int> randomValue1001 = List<int>.generate(101, (index) => index)
              ..shuffle(Random());

            n1 = randomValue1001[4].toString();
            n2 =randomValue1001[5].toString();
          });
        }





      }


      ans = random_ans.nextInt(4).toString();



      _countWrong_0 = false;
      _countWrong_1 = false;
      _countWrong_2 = false;
      _countWrong_3 = false;

    });
  }

  void updateCounter() {
    setState(() {
      if(_checkCounter < int.parse(getQData))
      {
        _checkCounter = _checkCounter + 1;
      }
      else
      {
        print("done");
      }

    });
  }
}
