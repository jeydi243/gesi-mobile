import 'package:flutter/material.dart';

class Meeting {
  Meeting(
      {required this.from,
      required this.to,
      this.id,
      this.recurrenceId,
      this.eventName = '',
      this.isAllDay = false,
      this.background,
      this.exceptionDates,
      this.recurrenceRule});

  DateTime from;
  DateTime to;
  Object? id;
  Object? recurrenceId;
  String eventName;
  bool isAllDay;
  Color? background;
  String? fromZone;
  String? toZone;
  String? recurrenceRule;
  List<DateTime>? exceptionDates;
}
