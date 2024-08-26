import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:librobot/Screens/AllCategories/CategoriesScreen/Fantasy.dart';
import 'package:librobot/Screens/AllCategories/CategoriesScreen/History.dart';
import 'package:librobot/Screens/AllCategories/CategoriesScreen/Horror.dart';
import 'package:librobot/Screens/AllCategories/CategoriesScreen/Romance.dart';
import 'package:librobot/Screens/AuthScreen/AuthScreens.dart';
import 'package:librobot/Screens/BottomNavigationBar/BottomNavigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import your BottomNavigationBar widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'KCET Library',
          theme: ThemeData(
            primaryColor: Colors.black,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          routes: {
          '/history': (context) => History(),
          '/romance' :(context)=>Romance() ,
          '/fantasy' :(context) => Fantasy(),
          '/horror': (context)=>Horror(),
        },
          home: child,
        );
      },
      
      child: AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkLoggedInStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading indicator if authentication status is being checked
          return CircularProgressIndicator();
        } else {
          if (snapshot.data == true) {
            // If user is logged in, navigate to home screen
            return BottomNavigationbar();
          } else {
            // If user is not logged in, navigate to authentication screen
            return AuthScreen();
          }
        }
      },
    );
  }

  Future<bool> checkLoggedInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
