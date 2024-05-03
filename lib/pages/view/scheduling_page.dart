import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulingPage extends StatefulWidget {
  const SchedulingPage({Key? key}) : super(key: key);

  @override
  State<SchedulingPage> createState() => _SchedulingPageState();
}

class _SchedulingPageState extends State<SchedulingPage> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  late final Map<DateTime, List<Map<String, String>>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    // Initializing event details for the current week's Monday
    _selectedEvents = {
      DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)): [
        {'time': '08:00 - 09:00 AM', 'event': 'Packaging'},
        {'time': '09:00 - 10:00 AM', 'event': 'Pick-up'},
        {'time': '10:00 - 11:00 AM', 'event': 'Delivery'},
        {'time': '11:00 - 12:00 AM', 'event': 'Arrival'},
      ],
    };
  }

  List<Map<String, String>> _getEventsForDay(DateTime day) {
    return _selectedEvents[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.sunday,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _getEventsForDay(_selectedDay).length,
              itemBuilder: (context, index) {
                final event = _getEventsForDay(_selectedDay)[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.check, color: Colors.white),
                    ),
                    title: Text(event['event'] ?? 'No event'),
                    subtitle: Text('${_selectedDay.month}/${_selectedDay.day}/${_selectedDay.year} | ${event['time']}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
