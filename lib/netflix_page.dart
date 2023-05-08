import 'package:flutter/material.dart';
import 'package:netflix/home_page.dart';

class NetflixPage extends StatelessWidget {
  const NetflixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
    );
  }
}
