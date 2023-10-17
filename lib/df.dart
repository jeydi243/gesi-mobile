import 'package:flutter/material.dart';
import 'package:gesi_mobile/models/event.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MeetingDataSource extends CalendarDataSource<Event> {
  MeetingDataSource(List<Event> meetings) {
    appointments = meetings;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  Object? getId(int index) {
    return appointments![index].id;
  }

  @override
  Object? getRecurrenceId(int index) {
    return appointments![index].recurrenceId as Object?;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background as Color;
  }

  @override
  List<DateTime>? getRecurrenceExceptionDates(int index) {
    return appointments![index].exceptionDates as List<DateTime>?;
  }

  @override
  String? getRecurrenceRule(int index) {
    return appointments![index].recurrenceRule;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName as String;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay as bool;
  }

  @override
  Event? convertAppointmentToObject(
      Event? customData, Appointment appointment) {
    return Event(
        from: appointment.startTime,
        to: appointment.endTime,
        eventName: appointment.subject,
        background: appointment.color,
        isAllDay: appointment.isAllDay,
        id: appointment.id,
        recurrenceRule: appointment.recurrenceRule,
        recurrenceId: appointment.recurrenceId,
        exceptionDates: appointment.recurrenceExceptionDates);
  }
}
