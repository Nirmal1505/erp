import 'package:flutter/material.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  final List<Map<String, String>> mondaySchedule = const [
    {
      'subject': 'Computer Science',
      'time': '08:15am - 09:00am',
      'teacher': 'Cherise James',
      'period': 'Period 1',
    },
    {
      'subject': 'Mathematics',
      'time': '09:00am - 09:45am',
      'teacher': 'Rivka Steadman',
      'period': 'Period 2',
    },
    {
      'subject': 'English',
      'time': '09:45am - 10:30am',
      'teacher': 'Marta Magana',
      'period': 'Period 3',
    },
    {
      'subject': 'Lunch Break',
      'time': '10:30am - 11:00am',
      'emoji': '🥪',
    },
    {
      'subject': 'Science',
      'time': '11:00am - 11:45am',
      'teacher': 'Danica Partridge',
      'period': 'Period 4',
    },
    {
      'subject': 'Social Study',
      'time': '11:45am - 12:30pm',
      'teacher': '',
      'period': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Timetable"),
          leading: const BackButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: const TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.blue,
            ),
            tabs: [
              Tab(text: "MON"),
              Tab(text: "TUE"),
              Tab(text: "WED"),
              Tab(text: "THU"),
              Tab(text: "FRI"),
              Tab(text: "SAT"),
            ],
          ),
        ),
        body: TabBarView(
          children: List.generate(6, (index) {
            // Just repeating Monday schedule for all days for now
            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: mondaySchedule.length,
              itemBuilder: (context, i) {
                final entry = mondaySchedule[i];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(entry['subject'] ?? '',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.access_time, size: 16, color: Colors.blue),
                              const SizedBox(width: 4),
                              Text(
                                entry['time'] ?? '',
                                style: const TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                          if (entry.containsKey('emoji'))
                            Text(
                              entry['emoji'] ?? '',
                              style: const TextStyle(fontSize: 20),
                            ),
                        ],
                      ),
                      if (entry.containsKey('teacher') && entry['teacher']!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(entry['teacher'] ?? ''),
                              Text(entry['period'] ?? '',
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                    ],
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
