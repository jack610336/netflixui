import 'package:flutter/material.dart';

class MovieCardEasy extends StatelessWidget {
  final String cardUrl;
  const MovieCardEasy({super.key, required this.cardUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 3.5,
        height: MediaQuery.of(context).size.height / 5,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(image: AssetImage(cardUrl), fit: BoxFit.cover)));
  }
}
