import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../df.dart';

class Calendar extends StatefulWidget {
  Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  void calendarTapped(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.appointment ||
        details.targetElement == CalendarElement.agenda) {
      // final Meeting _meeting = details.appointments![0];

      Get.snackbar("Details on tap", "message $details");
    }
  }

  MeetingDataSource? _dataSource;
  @override
  void initState() {
    _dataSource = MeetingDataSource();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      showNavigationArrow: true,
      allowAppointmentResize: true,
      allowDragAndDrop: true,
      allowViewNavigation: true,
      scheduleViewSettings: ScheduleViewSettings(
          appointmentItemHeight: 60,
          weekHeaderSettings: WeekHeaderSettings(
            height: 40,
            textAlign: TextAlign.center,
          )),
      dataSource: _dataSource,
      view: CalendarView.workWeek,
      timeSlotViewSettings: TimeSlotViewSettings(
          timeFormat: "h:mm",
          timeTextStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.teal[500],
              fontStyle: FontStyle.italic)),
      monthViewSettings: MonthViewSettings(showAgenda: true),
      showWeekNumber: true,
      backgroundColor: Colors.white,
      cellBorderColor: Colors.teal[500],
      headerStyle: CalendarHeaderStyle(
          backgroundColor: Colors.teal[500],
          textStyle: TextStyle(color: Colors.white)),
      appointmentBuilder: (ctx, apoi) {
        return Container(
          color: Colors.blue,
          child: Text(
            apoi.date.day.toString(),
          ),
        );
      },
      onTap: calendarTapped,
    );
  }
}
