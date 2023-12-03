import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_review/launch_review.dart';
import 'package:match_cards/Screens/HomeScreens.dart';
import 'package:match_cards/utils/constants.dart';
import 'package:page_transition/page_transition.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {


  final assetsAudioPlayer = AssetsAudioPlayer();


  @override
  Widget build(BuildContext context) {


    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      backgroundColor: kback,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    assetsAudioPlayer.open(
                      Audio("assets/audios/click.wav"),
                    );

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.home,size: 40,color: Colors.white60,),
                  ),
                ) ,
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, PageTransition(type: PageTransitionType.topToBottom, child: HomeScreens(), childCurrent: ResultScreen()));

                    assetsAudioPlayer.open(
                      Audio("assets/audios/click.wav"),
                    );


                    launchPlay();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.star,size: 40,color: Colors.white60,),
                  ),
                ),

              ],
            ),


            SizedBox(height: 10,),

            CircleAvatar(
              backgroundColor: ksplashback,
              child: Align(
                alignment: Alignment.center,
                child: Text('100%' ,
                    style: GoogleFonts.akayaTelivigala(textStyle: TextStyle( height: 0.1,fontSize: 126,color: Colors.white70,fontWeight: FontWeight.w900,))
                ),
              ),
              maxRadius: 90,
            ),

            SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('5' ,
                    style: GoogleFonts.akayaTelivigala(textStyle: TextStyle( height: 0.1,fontSize: 86,color: Colors.white70,fontWeight: FontWeight.w900,))
                ),
                SizedBox(width: 40,),

                Icon(Icons.check,size: 80,color: Colors.white60,),
              ],
            ),

            SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('1' ,
                    style: GoogleFonts.akayaTelivigala(textStyle: TextStyle( height: 0.1,fontSize: 86,color: Colors.white70,fontWeight: FontWeight.w900,))
                ),
                SizedBox(width: 40,),

                Icon(Icons.close,size: 80,color: Colors.white60,),
              ],
            ),

            SizedBox(height: 50,),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('00 : 20' ,
                      style: GoogleFonts.akayaTelivigala(textStyle: TextStyle( height: 0.1,fontSize: 70,color: Colors.white70,fontWeight: FontWeight.w900,))
                  ),
                ],
              ),
            ),

            SizedBox(height: 50,),

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
                        Text("Share with your friends",
                            style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 18,color: Colors.white70,fontWeight: FontWeight.w800,letterSpacing: 0.5))
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
                        Text("Rate Us",
                            style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 18,color: Colors.white70,fontWeight: FontWeight.w800,letterSpacing: 0.5))
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:18.0),
                          child: Icon(Icons.star,size: 30,color: Colors.white60,),
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
                        Text("Back to Home Screen",
                            style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 18,color: Colors.white70,fontWeight: FontWeight.w800,letterSpacing: 0.5))
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:18.0),
                          child: Icon(Icons.home,size: 30,color: Colors.white60,),
                        ) ,

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void launchPlay() async {
  LaunchReview.launch(
    androidAppId: androidAppIdValue,
    iOSAppId: iOSAppIdValue,);
}

