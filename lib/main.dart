import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:web_stripe/web_strip_service.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget with StripService {
  MyHomePage({super.key, required this.title});

  final String title;

  final int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          log('Initializing payment...');
          String paymentID = await makePaymentService(context, "5000");
          if (paymentID.isEmpty) {
            log('Payment failed, please try again');
          } else {
            log('Payment successful, ID: $paymentID');
            bool paymentSuccess =
                await checkPaymentStatus(payment_intent_id: paymentID);
            if (paymentSuccess) {
              log('Payment status confirmed');
            } else {
              log('Payment status could not be confirmed');
            }
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
