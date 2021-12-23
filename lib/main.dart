import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stream_nime/constant/color.dart';
import 'package:stream_nime/screen/splash/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Superninja Picker',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          brightness: Brightness.light,
          highlightColor: darkCard,
          indicatorColor: darkCard,
          focusColor: primaryTrans,
          primaryColor: darkCard,
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }),
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.blue)),
          ),
          accentColor: accent,
          fontFamily: "Pops",
          canvasColor: darkCard,
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(Colors.blue),
          )),
      home: SplashScreen(),
    );
  }
}
