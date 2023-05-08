import 'package:flutter/material.dart';
import 'package:netflix/movie_card.dart';
import 'package:netflix/recemtly_add.dart';
import 'package:palette_generator/palette_generator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color dominantColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _extractDominantColor();
  }

  _extractDominantColor() async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(
        'https://flxt.tmsimg.com/assets/p13514174_b_v13_al.jpg',
      ), // Replace with your own image path
    );

    setState(() {
      dominantColor = paletteGenerator.dominantColor?.color ?? Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dominantColor,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: CustomSliverAppBarDelegate(dominantColor: dominantColor),
          ),
          SliverList(
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Text('Popular on Netflix',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
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
                      childCount: 7,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  CustomSliverAppBarDelegate(
      {required this.dominantColor}); // Add this constructor

  final Color dominantColor;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double rowOpacity = 1.0 - (shrinkOffset / maxExtent);

    return Container(
      color: dominantColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text('For LEE CHUN'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.cast),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
              ),
            ],
          ),
          Expanded(
            child: Opacity(
              opacity: rowOpacity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        print('TV Shows');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.white, width: 0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          child: Text('TV Shows',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        print('Movies');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.white, width: 0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          child: Text('Movies',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        print('Categories');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.white, width: 0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          child: Row(
                            children: [
                              Text('Categories',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  )),
                              Icon(Icons.keyboard_arrow_down,
                                  color: Colors.white, size: 14)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 150.0;

  @override
  double get minExtent => kToolbarHeight + 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
