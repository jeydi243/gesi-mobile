import 'package:flutter/material.dart';
import 'package:gesi_mobile/widgets/stats2.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Get.theme.scaffoldBackgroundColor,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        width: Get.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              // CircleAvatar(
              //   backgroundColor: Color.fromARGB(255, 221, 222, 231),
              // ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text("Kadiongo Ilunga",
              //         style:
              //             TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
              //     Text("email@email")
              //   ],
              // ),
              Container(
                height: Get.height * .3,
                width: Get.width * .9,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 161, 241, 255),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: Stats2("Niveau de reussite"),
              )
            ]),
      ),
    );
  }
}
