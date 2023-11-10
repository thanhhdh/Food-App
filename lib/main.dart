import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_order_app/config/colors.dart';
import 'package:food_order_app/providers/product_provider.dart';
import 'package:food_order_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isAuthenticated = false; // Biến cờ để theo dõi trạng thái đăng nhập

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      setState(() {
        isAuthenticated = user != null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
        ),
        debugShowCheckedModeBanner: false,
        home: SignIn(),
      ),
    );
  }
}
