import 'package:flutter/material.dart';
import 'package:gesi_mobile/screens/courses/courseList.dart';

class Courses extends StatefulWidget {
  Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: CourseList());
  }
}
