import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset('Images/Pattern (2).png'),
          OutlinedButton(
            onPressed: () {},
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
              subtitle:Row(
                children: [
                  Text('Mohamed khaled',
                      style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                      color: Color(0xffFFFFFF),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,

                      ),

                      ),
                  ),
Image.asset("Images/Verified.png"),

                ],
              ) ,
              trailing: Image.asset('Images/google-logo-9808.png'),
            ),
          ),
        ],
      ),
    );
  }
}
