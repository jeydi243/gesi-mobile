import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gesi_mobile/screens/services/serviceDetails.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceList extends StatefulWidget {
  const ServiceList(this.index, {Key? key}) : super(key: key);
  final int index;
  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.theme.scaffoldBackgroundColor,
      height: Get.height,
      width: Get.width,
      alignment: Alignment.topCenter,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
                tag: '${widget.index}-title',
                child: Text(
                  "Title",
                  style:
                      GoogleFonts.k2d(fontWeight: FontWeight.bold, height: 20),
                )),
            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        duration: 1.seconds,
                        curve: Curves.easeInOutBack,
                        child: FadeInAnimation(
                          child: GestureDetector(
                              onTap: () {
                                Get.to(() => ServiceDetails());
                              },
                              child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Get.theme.scaffoldBackgroundColor
                                          .withOpacity(.6),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Text('data'))),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
