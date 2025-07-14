// TODO Implement this library.
// lib/screens/attendance_screen.dart
import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F0FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: const Text(
          "Attendance",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFF5B8DEE), Color(0xFF306FD8)]),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chip(label: Text("ATTENDANCE")),
                SizedBox(width: 16),
                // Chip(label: Text("HOLIDAY")),
              ],
            ),
          ),
          const Text(
            "NOVEMBER 2020",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildCalendar(),
          const SizedBox(height: 24),
          _buildLegend("Absent", "02", Colors.red),
          const SizedBox(height: 12),
          _buildLegend("Festival & Holidays", "01", Colors.green),
        ],
      ),
    );
  }

  static Widget _buildCalendar() {
    // For simplicity, this is a static layout (not dynamic calendar widget)
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: List.generate(30, (index) {
        final day = index + 1;
        Color? color;
        if (day == 8 || day == 23) {
          color = Colors.red;
        } else if (day == 20) {
          color = Colors.green;
        } else if ([4, 11, 18, 25].contains(day)) {
          color = Colors.blue.shade200;
        }

        return Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color ?? Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Text(
            '$day',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      }),
    );
  }

  static Widget _buildLegend(String label, String count, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(width: 16, height: 16, color: color),
          const SizedBox(width: 8),
          Expanded(child: Text(label)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              count,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
