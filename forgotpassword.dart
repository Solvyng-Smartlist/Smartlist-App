import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forgot Password App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ForgotPasswordPage(),
    );
  }

  
}

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key); // Corrected the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FORGOT PASSWORD'), // Removed unnecessary const
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'OH NO! FORGOT MY PASSWORD', // Removed unnecessary const
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10), // Removed unnecessary const
            const Text(
              'Enter your email address or phone number and we will send you a link to change a new password.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10), // Removed unnecessary const
            TextFormField(
              decoration: const InputDecoration( // Removed unnecessary const
                labelText: 'Email Address or Phone Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10), // Removed unnecessary const
            ElevatedButton(
              onPressed: () {
                // Implement the logic to send a reset email here
              },
              child: const Text('Send'), // Removed unnecessary const
            ),
          ],
        ),
      ),
    );
  }
}
