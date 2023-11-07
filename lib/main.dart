import 'package:flutter/material.dart';
import 'package:food_order_app/auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_order_app/config/colors.dart';
import 'firebase_options.dart';
import 'screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
