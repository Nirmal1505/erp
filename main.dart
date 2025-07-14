// main.dart
import 'package:flutter/material.dart';
import 'package:internship_app/screens/Holiday_screen.dart';
import 'package:internship_app/screens/dashboard_screen.dart';
import 'package:internship_app/screens/events_screen.dart';
import 'package:internship_app/screens/login_screen.dart';
import 'package:internship_app/screens/profile_screen.dart';
import 'package:internship_app/screens/attendance_screen.dart';
import 'package:internship_app/screens/fees_screen.dart';
import 'package:internship_app/screens/result_screen.dart';
import 'package:internship_app/screens/timetable_screen.dart';
void main() {
  runApp(const StudentERPApp());
}

class StudentERPApp extends StatelessWidget {
  const StudentERPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student ERP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/dashboard', // Or '/' if you plan to show Login first
      routes: {

        '/': (context) => const  LoginPage(), // You can change this to LoginScreen() if needed
        '/dashboard': (context) => const  DashboardPage(),
        '/profile': (context) => const ProfilePage(),
        '/login': (context) => const  LoginPage (),
        '/attendance': (context) => const AttendanceScreen(),
        '/fees': (context) => const FeesScreen(),
        '/result': (context) => const ResultScreen(),
        '/holiday': (context) => HolidayScreen(),
        '/events':(context)=>EventsScreen(),
        '/timetable': (context) => const TimetableScreen(),
      },
    );
  }
}
