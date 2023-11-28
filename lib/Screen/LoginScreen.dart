import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/Screen/Home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) =>  HomeScreen(),
          ),
              (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('Images/Pattern (2).png'),
            OutlinedButton(
              onPressed: () async {
                final UserCredential userData = await signInWithGoogle();

                uploadUserData(userData);

                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) =>  HomeScreen(),
                  ),
                      (route) => false,
                );
              },
              child: ListTile(
                title: Text(
                  'Log in with Google',
                  style: GoogleFonts.dmSans(
                    textStyle: TextStyle(
                        color: Color(0xffB2B3B2),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Text(
                      'Mohamed khaled',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Image.asset("Images/Verified23.png"),
                  ],
                ),
                trailing: Image.asset('Images/google-logo-9808.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void uploadUserData(UserCredential userData) {
    final database = FirebaseFirestore.instance;

    database.collection('users').doc(userData.user?.uid).set(
      {
        'name': userData.user?.displayName,
        'photoURL': userData.user?.photoURL,
      },
      SetOptions(merge: true),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
    await GoogleSignIn(scopes: ['profile', 'email']).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}