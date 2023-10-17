// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:gesi_mobile/constantes/values.dart';
import 'package:gesi_mobile/screens/events/detailsEvent.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../df.dart';
import '../models/event.dart';

class Calendar extends StatefulWidget {
  Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> with TickerProviderStateMixin {
  CalendarController _calendarController = CalendarController();
  final _key = GlobalKey<ExpandableFabState>();
  CalendarView _view = CalendarView.month;
  AnimationController? controller;
  Animation? colorAnimation;
  Animation? sizeAnimation;
  void calendarTapped(CalendarTapDetails details) async {
    await HapticFeedback.vibrate();
    if (details.targetElement == CalendarElement.appointment ||
        details.targetElement == CalendarElement.agenda) {
      // final Meeting _meeting = details.appointments![0];

      Get.snackbar("Details on tap", "message $details",
          backgroundColor: Colors.white,
          forwardAnimationCurve: Curves.easeInOutCirc);
    }
  }

  void calendarLongPress(CalendarLongPressDetails details) async {
    await HapticFeedback.vibrate();
    if (details.targetElement == CalendarElement.appointment ||
        details.targetElement == CalendarElement.agenda) {
      // final Meeting _meeting = details.appointments![0];

      Get.snackbar("Details on tap", "message $details",
          backgroundColor: Colors.white,
          forwardAnimationCurve: Curves.easeInOutCirc);
    }
  }

  @override
  void initState() {
    _calendarController = CalendarController();
    _calendarController.selectedDate = DateTime.now(); //(2022, 03, 18);
    _calendarController.displayDate = DateTime.now(); //(2022, 03, 18);
    super.initState();
  }

  MeetingDataSource? getsource() {
    List<Event> events = <Event>[];
    final DateTime exceptionDate = DateTime(2021, 07, 20);
    final Event recurrenceApp = Event(
      from: DateTime(2022, 03, 18, 10),
      to: DateTime(2022, 03, 18, 12),
      eventName: 'Planning',
      id: '02',
      background: Colors.blue,
      recurrenceRule: 'FREQ=DAILY;COUNT=20',
      exceptionDates: <DateTime>[exceptionDate],
    );
    final Event normalAppointment = Event(
      from: DateTime(2022, 03, 18, 20),
      to: DateTime(2022, 03, 18, 21, 30),
      eventName: 'Planning',
      id: '01',
      background: Colors.pink,
    );
    final Event exceptionAppointment = Event(
        from: exceptionDate.add(const Duration(hours: 14)),
        to: exceptionDate.add(const Duration(hours: 15)),
        eventName: 'Changed occurence',
        id: '03',
        background: Colors.pinkAccent,
        recurrenceId: recurrenceApp.id);
    events.add(normalAppointment);
    events.add(recurrenceApp);
    events.add(exceptionAppointment);
    events.add(Event(
      from: DateTime.now().add(const Duration(hours: 4, days: -1)),
      to: DateTime.now().add(const Duration(hours: 5, days: -1)),
      eventName: 'Release Meeting',
      id: '04',
      background: Colors.lightBlueAccent,
    ));
    return MeetingDataSource(events);
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: _key,
        children: [
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.calendar_today),
            onPressed: () {
              setState(() {
                _view = CalendarView.day;
              });
              final state = _key.currentState;
              if (state != null) {
                debugPrint('isOpen:${state.isOpen}');
                state.toggle();
              }
            },
          ),
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.calendar_month_sharp),
            onPressed: () {
              setState(() {
                _view = CalendarView.month;
              });
              final state = _key.currentState;
              if (state != null) {
                debugPrint('isOpen:${state.isOpen}');
                state.toggle();
              }
            },
          ),
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.calendar_view_week_rounded),
            onPressed: () {
              setState(() {
                _view = CalendarView.workWeek;
              });
              print(_view);
              final state = _key.currentState;
              if (state != null) {
                debugPrint('isOpen:${state.isOpen}');
                state.toggle();
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SfCalendar(
          showNavigationArrow: ctx.isPortrait ? false : true,
          allowAppointmentResize: true,
          controller: _calendarController,
          cellBorderColor: Color.fromARGB(34, 158, 158, 158),
          allowDragAndDrop: ctx.isPortrait ? false : true,
          allowViewNavigation: true,
          allowedViews: [
            CalendarView.day,
            CalendarView.month,
            CalendarView.workWeek
          ],
          onViewChanged: (viewChangedDetails) {
            print('View changed $viewChangedDetails !');
          },
          onTap: (CalendarTapDetails Caldet) {
            print(Caldet.appointments);
            print(Caldet.date);
            Get.to(() => DetailsEvent());
          },
          scheduleViewSettings: ScheduleViewSettings(
              appointmentItemHeight: 60,
              weekHeaderSettings: WeekHeaderSettings(
                height: 40,
                textAlign: TextAlign.end,
              )),
          dataSource: getsource(),
          appointmentTextStyle:
              TextStyle(color: Get.isDarkMode ? Colors.white : Colors.amber),
          view: _view,
          timeSlotViewSettings: TimeSlotViewSettings(
              timeFormat: "h:mm",
              dayFormat: "EEE",
              timeTextStyle: GoogleFonts.k2d(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.accent,
                  fontStyle: FontStyle.italic)),
          monthViewSettings: MonthViewSettings(showAgenda: true),
          backgroundColor: Get.theme.scaffoldBackgroundColor,
          headerStyle: CalendarHeaderStyle(
              backgroundColor: AppColors.accent,
              textStyle: GoogleFonts.k2d(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          appointmentBuilder: (ctx, apoi) {
            final Event meet = apoi.appointments.first;
            return Container(
              height: Get.height * .2,
              padding: EdgeInsets.only(left: 10, top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                color: meet.background,
                // border:
                //     Border(left: BorderSide(color: AppColors.accent, width: 3))
              ),
              // duration: 2.seconds,
              child: Text(
                '${apoi.appointments.first.eventName}',
                softWrap: false,
                style: GoogleFonts.k2d(
                    // overflow: TextOverflow.ellipsis,
                    color: AppColors.backgroundDark,
                    fontWeight: FontWeight.bold),
              ),
            );
          },
          onLongPress: calendarLongPress,
        ),
      ),
    );
  }
}
