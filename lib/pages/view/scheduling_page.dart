import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulingPage extends StatefulWidget {
  const SchedulingPage({super.key});

  @override
  _SchedulingPageState createState() => _SchedulingPageState();
}

class _SchedulingPageState extends State<SchedulingPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;

  late Map<DateTime, List<String>> _selectedEvents; // Using a simple String list for events

  @override
  void initState() {
    super.initState();
    _selectedEvents = {
      DateTime.now(): ['Event 1', 'Event 2']
    };
  }

  List<String> _getEventsForDay(DateTime day) {
    return _selectedEvents[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scheduling'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
            eventLoader: _getEventsForDay,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _getEventsForDay(_selectedDay).length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Event at ${index + 8}:00 AM'),
                  subtitle: Text('${_selectedDay.month}/${_selectedDay.day}/${_selectedDay.year} | ${index + 8}:00-${index + 9}:00 AM'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
