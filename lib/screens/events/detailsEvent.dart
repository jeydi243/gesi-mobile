import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gesi_mobile/controllers/appController.dart';
import 'package:get/get.dart';

class DetailsEvent extends StatefulWidget {
  const DetailsEvent({Key? key}) : super(key: key);

  @override
  State<DetailsEvent> createState() => _DetailsEventState();
}

class _DetailsEventState extends State<DetailsEvent> {
  late Stream streamOneEvent;

  @override
  Widget build(BuildContext context) {
    AppController ap = Get.find();
    return Container(
      color: Colors.yellow,
      child: StreamBuilder(
          stream: ap.listenToMe('id1'),
          builder: ((context, snapshot) {
            return ListView(children: [
              Image(
                  height: Get.height * .25,
                  image: NetworkImage(
                      'https://d1ymz67w5raq8g.cloudfront.net/Pictures/480xAny/4/7/6/139476_GettyImages-683867993.jpg'))
            ]);
          })),
    );
  }
}
