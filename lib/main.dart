import 'package:flutter/material.dart';
import 'package:http_v172/all_product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AllProductScreen(),
    );
  }
}
