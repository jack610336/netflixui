import 'package:flutter/material.dart';
import 'package:netflix/movie_card_easy.dart';

class RecentlyAdd extends StatefulWidget {
  final String imgPath;
  const RecentlyAdd({super.key, required this.imgPath});

  @override
  State<RecentlyAdd> createState() => _RecentlyAddState();
}

class _RecentlyAddState extends State<RecentlyAdd> {
  late String imgPath;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imgPath = widget.imgPath;
  }

  @override
  Widget build(BuildContext context) {
    return MovieCardEasy(cardUrl: imgPath);
  }
}
