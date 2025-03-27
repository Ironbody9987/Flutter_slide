import 'package:app2/LoginPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.blue.shade900,
          iconTheme: IconThemeData(
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          titleTextStyle: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}
