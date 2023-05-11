import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/movie_card.dart';
import 'package:netflix/recemtly_add.dart';
import 'package:netflix/util.dart';
import 'package:palette_generator/palette_generator.dart';

import 'custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color dominantColor = Colors.white;
  final ScrollController _controller1 = ScrollController();

  @override
  void initState() {
    super.initState();
    _extractDominantColor();
  }

  _extractDominantColor() async {
    final paletteGenerator =
        await PaletteGenerator.fromImageProvider(Util.mainVideoPic
            // Replace with your own image path
            );

    setState(() {
      dominantColor = paletteGenerator.dominantColor?.color ?? Colors.white;
    });
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
      backgroundColor: dominantColor,
      body: CupertinoScrollbar(
        controller: _controller1,
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate:
                  CustomSliverAppBarDelegate(dominantColor: dominantColor),
            ),

            // RecommendVideo Video
            recommendVideo(),
            // Recently Added
            recentlyAdded(),
            // Popular on Netflix
            popularOnNetflix()
          ],
        ),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon:
                Icon((_selectedIndex == 0) ? Icons.home : Icons.home_outlined),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon((_selectedIndex == 1)
                ? Icons.local_play_rounded
                : Icons.local_play_outlined),
            label: 'New & Hot'),
        BottomNavigationBarItem(
            icon: Icon((_selectedIndex == 2)
                ? Icons.download_for_offline
                : Icons.download_for_offline_outlined),
            label: 'Downloads'),
        // BottomNavigationBarItem(
        //     icon: Icon(Icons.download_done_rounded), label: 'More'),
      ],
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.grey[400],
      selectedItemColor: Colors.white,
      backgroundColor: dominantColor,
      onTap: _onItemTapped,
    );
  }

  Widget recommendVideo() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 1,
        (BuildContext context, int index) {
          return Container(
            color: dominantColor,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: MovieCardW(),
            ),
          );
        },
      ),
    );
  }

  Widget recentlyAdded() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Text('Recently Added',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 5,
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                          padding: EdgeInsets.only(
                              top: 0, bottom: 0, left: 16, right: 8),
                          child: RecentlyAdd(
                            imgPath: 'images/cv0${index + 1}.jpeg',
                          ));
                    },
                    childCount: 9,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget popularOnNetflix() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
            child: Text('Popular on Netflix',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 5,
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                          padding: EdgeInsets.only(
                              top: 0, bottom: 0, left: 16, right: 8),
                          child: RecentlyAdd(
                            imgPath: 'images/c0${index + 1}.jpeg',
                          ));
                    },
                    childCount: 9,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
