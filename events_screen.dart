import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> events = [
    {
      'title': 'Sleepover Night',
      'dateTime': DateTime(2021, 1, 6, 9, 0),
      'description':
      'A sleepover is a great treat for kids. Many schools use such an event as the culminating activity of the school year.',
    },
    {
      'title': 'Fishing Tournament',
      'dateTime': DateTime(2021, 1, 12, 9, 0),
      'description':
      'Silver Sands Middle School in Port Orange, Florida, offers many special events, but one of the most unique ones is a springtime...',
    },
    {
      'title': 'Rhyme Time: A Night of Poetry',
      'dateTime': DateTime(2021, 1, 24, 9, 0),
      'description':
      'April is also National Poetry Month. Now there is a great theme for a fun family night! Combine poetry readings by students...',
    },
  ];

  String formatDateTime(DateTime dateTime) {
    return DateFormat('dd MMM yy, hh:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events & Programs'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.event, color: Colors.grey),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.access_time,
                                size: 14, color: Colors.blue),
                            const SizedBox(width: 4),
                            Text(
                              formatDateTime(event['dateTime']),
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          event['description'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
