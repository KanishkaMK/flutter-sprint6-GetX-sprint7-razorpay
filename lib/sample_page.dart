import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getapp/home_page.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
late Razorpay _razorpay ;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response){
    Fluttertoast.showToast(msg: 'Success: ${response.paymentId}',toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: 'Error: ${response.code.toString()}',toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response){
    Fluttertoast.showToast(msg: 'ExternalWallet: ${response.walletName}',toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  void openPayement()async{
    var options = {
      'key': 'rzp_test_OcZJ6KqVEkWZF2',
      'key secret': 'ZyZyQ468mO1QSwbN3o5hM7F0',
      'amount': 100*100,
      'name': 'Baabtra',
      'description': 'Flutter',
      'retry': {
        'enabled': true,
        'max_count': 1
        },
      'send_sms_hash': true,
      'prefill': {
        'contact': '9876543321',
        'email': 'company@gmail.com',
      },
      'external':{
        'wallet': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      
      debugPrint('Error:$e');
    }
  }



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
            ElevatedButton(onPressed: () {
              openPayement();
              
            }, child: Text('Razorpay'))
          ],
        ),
      ),
    );
  }
}
