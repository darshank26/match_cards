import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:launch_review/launch_review.dart';
import 'package:match_cards/Screens/AddScreen.dart';
import 'package:match_cards/Screens/SettingScreen.dart';
import 'package:match_cards/Screens/SubScreen.dart';
import 'package:match_cards/utils/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../AdHelper/adshelper.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {

  final assetsAudioPlayer = AssetsAudioPlayer();

  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;


  late bool soundMode ;

  late bool getSoundMode;


  @override
  void initState() {
    super.initState();

    getSMo();


    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitIdOfHomeScreen,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();

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
  void dispose() {
    super.dispose();
    _bannerAd.dispose();
  }

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

                    if(getSoundMode)
                      {
                        assetsAudioPlayer.open(
                          Audio("assets/audios/click.wav"),
                        );
                      }


                    launchPlay();

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.star_rate,size: 40,color: Colors.white60,),
                  ),
                ) ,
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, PageTransition(type: PageTransitionType.topToBottom, child: SettingScreen(), childCurrent: HomeScreens()));

                    if(getSoundMode) {
                      assetsAudioPlayer.open(
                        Audio("assets/audios/click.wav"),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.settings,size: 40,color: Colors.white60,),
                  ),
                ),

              ],
            ),

            SizedBox(height: 20,),

            Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Math Cards",
                    style: GoogleFonts.mPlusRounded1c(textStyle: TextStyle(fontSize: 60,color: Colors.white70,fontWeight: FontWeight.w800,letterSpacing: 0.5))
            ),
               ],
             ),

            SizedBox(height: 50,),

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

                          if(getSoundMode) {
                            assetsAudioPlayer.open(
                              Audio("assets/audios/homeclick.wav"),
                            );
                          }

                          Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: AddScreen(), childCurrent: HomeScreens()));
                          },
                        child: CircleAvatar(
                          backgroundColor: ksplashback,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("+",
                                style: GoogleFonts.akayaTelivigala(textStyle: TextStyle(fontSize: 100,color: Colors.white70,fontWeight: FontWeight.w800,))
                            ),
                          ),
                          maxRadius: 80,
        ),
                      ),

                      GestureDetector(
                        onTap: () {


                          if(getSoundMode) {
                            assetsAudioPlayer.open(
                              Audio("assets/audios/homeclick.wav"),
                            );
                          }

                          Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: SubScreen(), childCurrent: HomeScreens()));


                        },
                        child: CircleAvatar(
                          backgroundColor: ksplashback,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("-",
                                style: GoogleFonts.akayaTelivigala(textStyle: TextStyle(fontSize: 100,color: Colors.white70,fontWeight: FontWeight.w800,))
                            ),
                          ),
                          maxRadius: 80,
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
                      CircleAvatar(
                        backgroundColor: ksplashback,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("\u00F7",
                              style: GoogleFonts.akayaTelivigala(textStyle: TextStyle(fontSize: 100,color: Colors.white70,fontWeight: FontWeight.w800,))
                          ),
                        ),
                        maxRadius: 80,
                      ),

                      CircleAvatar(
                        backgroundColor: ksplashback,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("X",
                              style: GoogleFonts.akayaTelivigala(textStyle: TextStyle(fontSize: 80,color: Colors.white70,fontWeight: FontWeight.w800,))
                          ),
                        ),
                        maxRadius: 80,
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_isBannerAdReady)
            Container(
              width: _bannerAd.size.width.toDouble(),
              height: _bannerAd.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd),
            ),
        ],
      ),

    );
  }


}

void launchPlay() async {
  LaunchReview.launch(
    androidAppId: androidAppIdValue,
    iOSAppId: iOSAppIdValue,);
}
