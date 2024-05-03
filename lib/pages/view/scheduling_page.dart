import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class SchedulingPage extends StatefulWidget {
  const SchedulingPage({Key? key}) : super(key: key);

  @override
  State<SchedulingPage> createState() => _SchedulingPageState();
}

class _SchedulingPageState extends State<SchedulingPage> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  final FlutterLocalNotificationsPlugin localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    var androidInitialize = new AndroidInitializationSettings('app_icon');
    var initializationSettings = new InitializationSettings(android: androidInitialize);
    localNotificationsPlugin.initialize(initializationSettings);

    // Initial setup for notifications
    _requestIOSPermissions();
  }

  void _requestIOSPermissions() {
    localNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<void> _scheduleReminder(DateTime dateTime, String event) async {
    tz.TZDateTime scheduleDate = tz.TZDateTime.from(dateTime.subtract(const Duration(minutes: 30)), tz.local);
    var androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel_description',
      importance: Importance.max,
      priority: Priority.high,
    );
    var platformDetails = NotificationDetails(android: androidDetails);
    await localNotificationsPlugin.zonedSchedule(
      0,
      'Reminder for $event',
      'Your event $event is starting soon!',
      scheduleDate,
      platformDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
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
            calendarFormat: CalendarFormat.month,
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
              itemCount: 4, // Assuming 4 events per day for simplicity
              itemBuilder: (context, index) {
                String event = "Event $index";
                DateTime eventTime = _selectedDay.add(Duration(hours: 8 + index)); // Example event times
                return ListTile(
                  title: Text(event),
                  subtitle: Text("${eventTime.hour}:00"),
                  trailing: IconButton(
                    icon: Icon(Icons.alarm),
                    onPressed: () => _scheduleReminder(eventTime, event),
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
