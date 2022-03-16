import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gesi_mobile/controllers/authController.dart';
import 'package:gesi_mobile/widgets/stats1.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AuthController controller = Get.find();

  Widget tabs(Map<String, dynamic> map) {
    return Tab(
      child: Row(children: [Icon(map['icon']), Text(map['title'])]),
    );
  }

  Widget tab_view(Map<String, dynamic> map) {
    return Tab(
      child: Row(children: [
        Icon(
          map['icon'],
          size: 15,
        ),
        Text(map['title'])
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.profileTabs.length,
      child: Container(
        padding: EdgeInsets.only(top: 10),
        color: Colors.white,
        height: Get.height,
        width: Get.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await HapticFeedback.mediumImpact();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.teal[50],
                        maxRadius: 40,
                        child: Icon(MdiIcons.account, size: 30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kadiongo Ilunga",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Ekadiongo@gmail.com",
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 13,
                            ),
                          ),
                          TextButton(
                              onPressed: controller.updateProfile,
                              child: Text("Modifier le profile"))
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                    enableFeedback: true,
                    onPressed: () => {},
                    icon: Icon(
                      MdiIcons.menu,
                      color: Colors.black,
                    ))
              ],
            ),
          ),
          Material(
            type: MaterialType.card,
            child: Obx(() => TabBar(tabs: [
                  ...controller.profileTabs
                      .map<Widget>((element) => tabs(element))
                      .toList()
                ])),
          ),
          Material(
            type: MaterialType.card,
            child: Container(
              width: Get.width,
              height: Get.height * .9,
              child: TabBarView(physics: BouncingScrollPhysics(), children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  width: Get.width,
                  child: Column(
                    children: [Stats1("Pourcentages")],
                  ),
                ),
                Container(
                  color: Colors.amber,
                  width: Get.width,
                ),
                Container(
                  color: Colors.purple,
                  width: Get.width,
                ),
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
