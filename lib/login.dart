import 'package:flutter/material.dart';
import 'package:gesi_mobile/controllers/authController.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class gesi extends StatefulWidget {
  gesi({Key? key}) : super(key: key);

  @override
  _gesiState createState() => _gesiState();
}

class _gesiState extends State<gesi> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.find();
  TextEditingController username = TextEditingController(text: "dfdfdfdf");
  TextEditingController password = TextEditingController(text: "dfdfdffff");
  void connexion() {
    final FormState? formState = _formKey.currentState;
    bool iValidForm = formState!.validate();
    if (iValidForm) {
      _formKey.currentState!.save();
      _authController.signIn();

    } else {
      print("Form is invalid");
    }
  }

  @override
  void initState() {
    super.initState();
  }

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
                  child: Form(
                    key: _formKey,
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
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: TextFormField(
                                  // controller: _authController.email,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value == "") {
                                      return 'Vous devez remplir le username';
                                    }
                                    if (value.length < 4) {
                                      return 'Too short';
                                    }
                                    return null;
                                  },
                                  cursorColor: Color(0xFF40FFAF),
                                  decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      isDense: true,
                                      contentPadding: EdgeInsets.fromLTRB(5, 5,
                                          5, 5), // control your hints text size
                                      labelText: "Name",
                                      hintText: "Name",
                                      errorStyle: TextStyle(
                                          color: Colors.red, fontSize: 11),
                                      focusedErrorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color.fromRGBO(
                                                  255, 7, 7, 1))),
                                      errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color.fromRGBO(
                                                  255, 7, 7, 1))),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2, color: Colors.amber)),
                                      focusColor: Colors.amberAccent),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: TextFormField(
                                  controller: _authController.password,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Vous devez remplir le mot de passe';
                                    }
                                    if (value.length < 4) {
                                      return 'Too short';
                                    }
                                    return null;
                                  },
                                  cursorColor: Color(0xFF40FFAF),
                                  decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      labelText: "Mot de passe",
                                      hintText: "*********",
                                      isDense: true,
                                      errorStyle: TextStyle(
                                          color: Colors.red, fontSize: 11),
                                      focusedErrorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color.fromRGBO(
                                                  255, 7, 7, 1))),
                                      errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color.fromRGBO(
                                                  255, 7, 7, 1))),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2, color: Colors.amber)),
                                      focusColor: Colors.amberAccent),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 35),
                          child: Text(
                            'By selecting Agree and Continue below, I agree to Terms of Service and Privacy Policy',
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          onPressed: connexion,
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
