import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/android/homepage_android.dart';
import 'pages/ios/homepage_ios.dart';
import 'provider/Platform_Switch.dart';
import 'provider/navigator_provader.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PlateformProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavigationProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (Provider.of<PlateformProvider>(context).isIos)
        ? CupertinoApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (_) => const HomepageIos(),
            },
          )
        : MaterialApp(
            theme: ThemeData(
              fontFamily: "poppins",
            ),
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => const HomepageAndriod(),
            },
          );
  }
}
