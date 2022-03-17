import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseDetails extends StatefulWidget {
  CourseDetails({Key? key}) : super(key: key);

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollEndNotification) {
              // We use 20 as our threshold to load more data
              if (notification.metrics.extentAfter < 20) {
                print('Load more data');
              }
            }
            return true;
          },
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverAppBar(
                expandedHeight: Get.height * .3,
                backgroundColor: Colors.blueAccent,
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    key: Key('top'),
                    tag: 'top',
                    child: Image.asset(
                      "assets/bg-2.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  stretchModes: [
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle,
                  ],
                  expandedTitleScale: 2,
                ),
              ),
              SliverPersistentHeader(
                  delegate: Sticky(TabBar(
                    tabs: [
                      Tab(text: "Description"),
                      Tab(text: "Overview"),
                      Tab(text: "Contenu")
                    ],
                    enableFeedback: true,
                    indicatorColor: Colors.teal,
                    overlayColor:
                        MaterialStateProperty.all<Color?>(Colors.teal[50]),
                  )),
                  pinned: true),
              SliverToBoxAdapter(
                child: Material(
                  // type: MaterialType.card,
                  child: Container(
                    width: Get.width,
                    height: Get.height,
                    child: TabBarView(
                      children: [
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                  tag: 'null',
                                  child: Text(
                                    'Introduction a la progr',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  )),
                              Text(
                                  "lorem ipsum Dolore deserunt cupidatat proident commodo nulla esse culpa ex anim cillum consectetur qui. Lorem anim sint ad pariatur reprehenderit tempor velit reprehenderit ad esse enim cillum. Ut incididunt culpa nisi reprehenderit adipisicing id ex quis adipisicing.")
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.red,
                        ),
                        Container(
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Sticky extends SliverPersistentHeaderDelegate {
  Sticky(this._tabBar);
  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white, // ADD THE COLOR YOU WANT AS BACKGROUND.
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
