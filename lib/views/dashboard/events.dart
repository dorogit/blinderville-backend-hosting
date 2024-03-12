import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
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
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
Widget Events(context){
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SfCalendar(
      view: CalendarView.month,
      dataSource: MeetingDataSource([
        Meeting(
            'Fluttering Mumbai',
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, 9, 0, 0),
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day+10, 9, 0, 0),
            const Color(0xFF0F8644),
            false),
        Meeting(
            'Oberoi Hotel Meetup',
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day+2, 9, 0, 0),
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day+3, 9, 0, 0),
            const Color(0xFF0F8644),
            false)
      ]),
      monthViewSettings: MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ),
    );
}

List<Meeting> getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month+1, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Meeting(
      'Conference', startTime, endTime, const Color(0xFF0F8644), false));
  print(MeetingDataSource(meetings));
  return meetings;
}



  