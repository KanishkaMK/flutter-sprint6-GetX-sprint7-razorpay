import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getapp/home_page.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'GETAPP',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Welcome to home screen'),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.snackbar('Notification', 'Welcome User',
                      icon: Icon(Icons.notifications),
                      snackPosition: SnackPosition.TOP,
                      duration: Duration(seconds: 4));
                },
                child: Text('Click Me')),
            SizedBox(
              height: 50,
            ),
            TextButton(onPressed: () {
              Get.to(HomePage());
            }, child: Text('Route')),
          ],
        ),
      ),
    );
  }
}
