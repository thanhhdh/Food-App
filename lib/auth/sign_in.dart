import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:food_order_app/providers/user_provider.dart';
import 'package:food_order_app/screens/home/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  UserProvider? userProvider;
  bool isSignedIn = false;
  Future<User?> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
        'email',
      ]);
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        userProvider!.addUserData(
          currentUser: user,
          userEmail: user.email,
          userImage: user.photoURL,
          userName: user.displayName,
        );
        setState(() {
          isSignedIn = true; // Đặt biến cờ thành true khi đăng nhập thành công
        });
        return user;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    if (isSignedIn) {
      // Đã đăng nhập, điều hướng đến HomeScreen
      return HomeScreen();
    }
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(''))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 400,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Sign in to continue'),
                Text(
                  'Vegi',
                  style: TextStyle(fontSize: 50, color: Colors.white, shadows: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.green.shade900,
                      offset: Offset(3, 3),
                    )
                  ]),
                ),
                Column(
                  children: [
                    SignInButton(
                      Buttons.Apple,
                      text: "Sign up with Apple",
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SignInButton(
                      Buttons.Google,
                      text: "Sign up with Google",
                      onPressed: () async {
                        _googleSignUp().then(
                          (value) => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'By signing in are you agreeing to our',
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                    Text('Terms and Pricacy Policy',
                        style: TextStyle(color: Colors.grey[800])),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
