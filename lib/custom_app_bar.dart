import 'package:flutter/material.dart';

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
