import 'package:flutter/material.dart';
import 'package:quotes_create/views/screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      routes: {
        '/': (context) => const HomePage(),
      },
    ),
  );
}
