import 'package:flutter/material.dart';
import 'questions.dart';
// import 'dart:ui_web';

void main() {
  // debugEmulateFlutterTesterEnvironment = false;
  runApp(const QuestionAnswerApp());
}

class QuestionAnswerApp extends StatelessWidget {
  const QuestionAnswerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Question Answer App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light,
        ),
      ),
      home: const QuestionAnswerPage(),
    );
  }
}

class QuestionAnswerPage extends StatefulWidget {
  const QuestionAnswerPage({super.key});

  @override
  _QuestionAnswerPageState createState() => _QuestionAnswerPageState();
}

class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  List<bool> isAnswerVisible =
      List<bool>.generate(questions.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Frequently Asked Questions'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
            top: Radius.circular(30),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            // Handle profile picture tap
            print('Profile picture tapped');
          },
          child: const CircleAvatar(
            backgroundImage: AssetImage('lib/assets/dp.jpg'),
          ),
        ),
      ),
      body: Container(
        // height: 300,
        // width: 300,
        decoration: const BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage('lib/assets/logo_name.jpg'),
            //   fit: BoxFit.cover,
            // ),
            // color: Colors.black.withOpacity(0.5),
            ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    questions[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      isAnswerVisible[index] = !isAnswerVisible[index];
                    });
                  },
                  subtitle:
                      isAnswerVisible[index] ? Text(answers[index]) : null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
