import 'package:flutter/material.dart';
import 'package:gesi_mobile/models/meeting.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MeetingDataSource extends CalendarDataSource<Meeting> {
  MeetingDataSource() {
    List<Meeting> appointments = <Meeting>[];
    final DateTime exceptionDate = DateTime(2021, 07, 20);

    final Meeting normalAppointment = Meeting(
      from: DateTime(2022, 02, 23, 10),
      to: DateTime(2022, 02, 24, 12),
      eventName: 'Planning',
      id: '01',
      background: Colors.pink,
    );

    appointments.add(normalAppointment);
    final Meeting recurrenceApp = Meeting(
      from: DateTime(2021, 07, 11, 10),
      to: DateTime(2021, 07, 11, 12),
      eventName: 'Planning',
      id: '02',
      background: Colors.green,
      recurrenceRule: 'FREQ=DAILY;COUNT=20',
      exceptionDates: <DateTime>[exceptionDate],
    );

    appointments.add(recurrenceApp);

    final Meeting exceptionAppointment = Meeting(
        from: exceptionDate.add(const Duration(hours: 14)),
        to: exceptionDate.add(const Duration(hours: 15)),
        eventName: 'Changed occurence',
        id: '03',
        background: Colors.pinkAccent,
        recurrenceId: recurrenceApp.id);

    appointments.add(exceptionAppointment);

    appointments.add(Meeting(
      from: DateTime.now().add(const Duration(hours: 4, days: -1)),
      to: DateTime.now().add(const Duration(hours: 5, days: -1)),
      eventName: 'Release Meeting',
      id: '04',
      background: Colors.lightBlueAccent,
    ));
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
  Meeting? convertAppointmentToObject(
      Meeting? customData, Appointment appointment) {
    return Meeting(
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
