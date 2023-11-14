import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'Images/Vector.png',
              width: 30.11,
            ),
          ],
        ),
      ),
      body:Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Image.asset('Images/Ellipse 1.png'),
                    ),

                  ),
                ],
              ),
              Row(children: [Text('Zack')],)

            ],
          ),


        ],
      ),
    );
  }
}
