import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:gesi_mobile/screens/course-details.dart';
import 'package:get/get.dart';

class CourseList extends StatefulWidget {
  CourseList({Key? key}) : super(key: key);

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemCount: 10,
      addAutomaticKeepAlives: true,
      controller: ScrollController(),
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return OpenContainer(
          transitionDuration: .900.seconds,
          // transitionType: ContainerTransitionType.fadeThrough,
          closedBuilder: (BuildContext context, void Function() action) {
            return Container(
              color: Colors.white,
              height: Get.height * .09,
              child: GestureDetector(
                onTap: action,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Hero(
                        key: Key('top1'),
                        tag: 'top',
                        child: Image.asset(
                          "assets/bg-2.jpg",
                          height: Get.height * .09,
                          width: Get.height * .09,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text.rich(
                            TextSpan(
                                text:
                                    "Introduction à la Programmtion orienté "),
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 7, 72, 105),
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Started by ',
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              TextSpan(
                                text: '20-02-2022',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.blueGrey[900],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          softWrap: true,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Author: ',
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              TextSpan(
                                text: 'Igr Musumbu',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.blueGrey[900],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          softWrap: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          openBuilder: (BuildContext context,
              void Function({Object? returnValue}) action) {
            return CourseDetails();
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 10,
        );
      },
    );
  }
}
