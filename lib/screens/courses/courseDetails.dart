import 'package:badges/badges.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gesi_mobile/constantes/values.dart';
import 'package:gesi_mobile/controllers/appController.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';

class CourseDetails extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        color: AppColors.backgroundDark,
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
                    child: Stack(
                      children: [
                        Align(
                          child: SizedBox(
                            width: Get.width,
                            child: Image.asset(
                              "assets/bg-2.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                        Align(
                          alignment: Alignment(0, 1),
                          child: GlassContainer.clearGlass(
                            borderColor: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white.withOpacity(.2),
                            borderWidth: 0,
                            blur: 5,
                            margin: EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.only(left: 10),
                            height: Get.height * .08,
                            width: Get.width * .90,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pr. Hordoro",
                                ),
                                RatingBar.builder(
                                  initialRating: 4,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemSize: 20.0,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 2),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
                  floating: false,
                  delegate: SafeAreaPersistentHeaderDelegate(
                      expandedHeight: 70,
                      child: TabBar(
                        padding: EdgeInsets.only(top: 0),
                        tabs: [
                          Tab(
                            text: "Description",
                          ),
                          Tab(text: "Reviews"),
                          Tab(text: "Assesements")
                        ],
                        enableFeedback: true,
                        unselectedLabelColor: Colors.white,
                        indicatorColor: Colors.teal,
                        overlayColor:
                            MaterialStateProperty.all<Color?>(Colors.teal[500]),
                      )),
                  pinned: true),
              SliverToBoxAdapter(
                child: Material(
                  // type: MaterialType.card,
                  color: AppColors.backgroundDark,
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
                                      'Introduction à la programmation',
                                      style: Get.textTheme.headline4!.copyWith(
                                          color: AppColors.accent,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              Text(
                                  "lorem ipsum Dolore deserunt cupidatat proident commodo nulla esse culpa ex anim cillum consectetur qui. Lorem anim sint ad pariatur reprehenderit tempor velit reprehenderit ad esse enim cillum. Ut incididunt culpa nisi reprehenderit adipisicing id ex quis adipisicing."),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 8),
                                child: Row(children: [
                                  Badge(
                                    toAnimate: false,
                                    shape: BadgeShape.square,
                                    badgeColor:
                                        AppColors.accentDark.withOpacity(.5),
                                    borderRadius: BorderRadius.circular(20),
                                    badgeContent: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text('Technology',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      margin: EdgeInsets.only(right: 8),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: ExtendedImage.network(
                                            "https://mdbcdn.b-cdn.net/img/new/avatars/3.webp",
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                    Text(
                                      "Phd. Kadiongo",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Get.height * .05,
                                child: Row(
                                  children: [
                                    Text(
                                      "Lessons",
                                      style: Get.textTheme.headline5!
                                          .copyWith(color: AppColors.accent),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Get.height,
                                width: Get.width,
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 50,
                                      margin: EdgeInsets.only(bottom: 10),
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border(
                                            left: BorderSide(
                                                width: 4,
                                                color: AppColors.accent,
                                                style: BorderStyle.solid),
                                          )),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: AppColors.backgroundDark,
                        ),
                        Container(
                          color: AppColors.backgroundDark,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Material(
                  child: Text(
                      "By Sit occaecat dolore dolore sit cillum pariatur qui."),
                ),
              )
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

class SafeAreaPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  SafeAreaPersistentHeaderDelegate(
      {required this.child, required this.expandedHeight});
  final Widget child;

  final double expandedHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SafeArea(bottom: false, child: SizedBox.expand(child: child));
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SafeAreaPersistentHeaderDelegate old) {
    if (old.child != child) {
      return true;
    }
    return false;
  }
}
