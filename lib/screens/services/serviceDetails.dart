import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceDetails extends StatefulWidget {
  const ServiceDetails(this.index, {Key? key}) : super(key: key);
  final int index;
  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
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
          ],
        ),
      ),
    );
  }
}
