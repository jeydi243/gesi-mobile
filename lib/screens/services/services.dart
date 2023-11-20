import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gesi_mobile/screens/services/serviceList.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Services extends StatefulWidget {
  Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Get.theme.scaffoldBackgroundColor,
      child: ListView.builder(
          itemCount: 10,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return OpenContainer(
              transitionDuration: .900.seconds,
              middleColor: Get.theme.scaffoldBackgroundColor,
              transitionType: ContainerTransitionType.fade,
              closedColor: Get.theme.scaffoldBackgroundColor,
              closedBuilder: (BuildContext context, void Function() action) {
                return ListTile(
                  isThreeLine: true,
                  title: Hero(
                    tag: '$index-title',
                    child: Text(
                      'Health Service',
                      style: GoogleFonts.k2d(fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Text(
                      'Np incididunt occaecat nisi. Ex aliqua labore magna irure cillum ex incididunt ex.'),
                  leading: SvgPicture.network(
                      'https://api.iconify.design/solar:slash-circle-bold-duotone.svg',
                      height: 40,
                      width: 40,
                      theme: SvgTheme(
                        currentColor: Colors.white,
                      )),
                  // trailing: Image.network(),
                );
              },
              openBuilder: (BuildContext context,
                  void Function({Object? returnValue}) action) {
                return ServiceList(index);
              },
            );
          }),
    ));
  }
}
