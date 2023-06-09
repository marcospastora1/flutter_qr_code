import 'package:flutter/material.dart';
import 'package:flutter_qr_code/generate_qr_code.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primaryColor: Colors.black54, primarySwatch: Colors.brown),
      home: GenerateQRCode(),
    );
  }
}
