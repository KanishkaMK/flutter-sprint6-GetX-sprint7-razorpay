import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Hello all'),
            Lottie.asset('assets/animations/animation_lmee49zy.json',fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}