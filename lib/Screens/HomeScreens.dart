import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:match_cards/utils/constants.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.settings,size: 40,color: Colors.white60,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.star_rate,size: 40,color: Colors.white60,),
                ) ,
              ],
            ),

            SizedBox(height: 20,),

            Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Math Cards",
                    style: GoogleFonts.akayaTelivigala(textStyle: TextStyle(fontSize: 66,color: Colors.white70,fontWeight: FontWeight.w800,letterSpacing: 1))
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
                      CircleAvatar(
                        backgroundColor: ksplashback,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("+",
                              style: GoogleFonts.akayaTelivigala(textStyle: TextStyle(fontSize: 100,color: Colors.white70,fontWeight: FontWeight.w800,))
                          ),
                        ),
                        maxRadius: 80,
                        foregroundImage: NetworkImage("enterImageUrl"),
        ),

                      CircleAvatar(
                        backgroundColor: ksplashback,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("-",
                              style: GoogleFonts.akayaTelivigala(textStyle: TextStyle(fontSize: 100,color: Colors.white70,fontWeight: FontWeight.w800,))
                          ),
                        ),
                        maxRadius: 80,
                        foregroundImage: NetworkImage("enterImageUrl"),
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
                        foregroundImage: NetworkImage("enterImageUrl"),
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
                        foregroundImage: NetworkImage("enterImageUrl"),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.settings,size: 40,color: Colors.white60,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.star_rate,size: 40,color: Colors.white60,),
          ) ,
      ],
    ),
    );
  }
}
