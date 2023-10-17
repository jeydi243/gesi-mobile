// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:gesi_mobile/constantes/values.dart';
import 'package:gesi_mobile/screens/courses/courseDetails.dart';
import 'package:get/get.dart';

class CourseList extends StatefulWidget {
  CourseList({Key? key}) : super(key: key);

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundDark,
      child: ListView.separated(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemCount: 5,
        addAutomaticKeepAlives: true,
        controller: ScrollController(),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return OpenContainer(
            transitionDuration: .900.seconds,
            middleColor: Get.theme.scaffoldBackgroundColor,
            closedColor: Get.theme.scaffoldBackgroundColor,
            closedBuilder: (BuildContext context, void Function() action) {
              return Container(
                color: AppColors.backgroundDark,
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
                            "assets/courses/2.jpg",
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
                                overflow: TextOverflow.ellipsis,
                                color: AppColors.accentDark,
                                fontWeight: FontWeight.bold,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis),
                          // Text.rich(
                          //   TextSpan(
                          //     children: [
                          //       TextSpan(
                          //         text: 'Started by ',
                          //         style: TextStyle(
                          //           fontSize: 13,
                          //         ),
                          //       ),
                          //       TextSpan(
                          //         text: '20-02-2022',
                          //         style: TextStyle(
                          //           fontSize: 13,
                          //           color: Colors.blueGrey[900],
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          //   softWrap: true,
                          // ),
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
                                    color: AppColors.accentDark,
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
            openBuilder: (context, action) {
              return CourseDetails();
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}
