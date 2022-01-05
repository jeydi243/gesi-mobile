import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.green[300],
            child: Image.asset(
              "assets/bg-1.jpg",
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Align(
            alignment: const Alignment(0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Sign up",
                    style: GoogleFonts.k2d(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
                GlassContainer.clearGlass(
                  borderColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(.2),
                  borderWidth: 0,
                  blur: 7,
                  padding: const EdgeInsets.all(10),
                  height: Get.height * .50,
                  width: Get.width * .95,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Looks like you dont have an account.\n Let's create a new account for you",
                          style: GoogleFonts.k2d(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Form(
                            child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: TextFormField(
                                cursorColor: Colors.amberAccent,
                                decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    isDense: true,
                                    labelText: "Name",
                                    hintText: "Name",
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.amber)),
                                    focusColor: Colors.amberAccent),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: TextFormField(
                                cursorColor: Colors.amberAccent,
                                decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelText: "Mot de passe",
                                    hintText: "*********",
                                    isDense: true,
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.amber)),
                                    focusColor: Colors.amberAccent),
                              ),
                            ),
                          ],
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 55),
                        child: Text(
                          'By selecting Agree and Continue below, I agree to Terms of Service and Privacy Policy',
                          style: Theme.of(context)
                              .textTheme
                              .button
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        animationDuration: 900.milliseconds,
                        height: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 0,
                        minWidth: double.infinity,
                        color: Color.fromRGBO(16, 185, 129, 1),
                        child: Text(
                          "Agree and Continue",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              ?.copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
