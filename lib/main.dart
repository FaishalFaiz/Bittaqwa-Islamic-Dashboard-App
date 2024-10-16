import 'package:bitaqwa_app/presentation/screen/doa_screen.dart';
import 'package:flutter/material.dart';

import 'presentation/screen/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Dashboard(),
        '/doa': (context) => DoaScreen(),
      },
    );
  }
}
