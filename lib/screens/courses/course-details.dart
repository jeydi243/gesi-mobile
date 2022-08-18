import 'package:flutter/material.dart';
import 'package:gesi_mobile/constantes/values.dart';
import 'package:gesi_mobile/controllers/appController.dart';
import 'package:get/get.dart';

class CourseDetails extends StatefulWidget {
  CourseDetails({Key? key}) : super(key: key);

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  AppController ff = Get.find();
  Color? appBarColor;
  @override
  void initState() {
    updateAppBarColor();
  }

  updateAppBarColor() {
    ff.findColor("assets/bg-1.jpg").then((value) {
      print("The color dominent before is $appBarColor");
      setState(() {
        appBarColor = value;
      });
      print("The color dominent after is $appBarColor");
    });
  }

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
                backgroundColor: AppColors.backgroundDark,
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
                      Tab(
                        text: "Description",
                      ),
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
                  child: SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: TabBarView(
                      children: [
                        Container(
                          color: AppColors.backgroundDark,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Hero(
                                    tag: 'null',
                                    child: Text(
                                      'Introduction a la programmation',
                                      style: Get.textTheme.headline4!
                                          .copyWith(color: AppColors.accent),
                                    )),
                              ),
                              Text(
                                  "lorem ipsum Dolore deserunt cupidatat proident commodo nulla esse culpa ex anim cillum consectetur qui. Lorem anim sint ad pariatur reprehenderit tempor velit reprehenderit ad esse enim cillum. Ut incididunt culpa nisi reprehenderit adipisicing id ex quis adipisicing.")
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                        ),
                        Container(
                          color: Colors.white,
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
