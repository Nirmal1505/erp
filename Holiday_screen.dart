import 'package:flutter/material.dart';

class HolidayScreen extends StatelessWidget {
  final Set<String> holidayDates = {'14', '15', '16'};
  final Set<String> sundays = {'1', '8', '15', '22', '29'};

  final List<List<String?>> calendar = [
    [null, null, null, null, null, '1', '2'],
    ['3', '4', '5', '6', '7', '8', '9'],
    ['10', '11', '12', '13', '14', '15', '16'],
    ['17', '18', '19', '20', '21', '22', '23'],
    ['24', '25', '26', '27', '28', '29', '30'],
    ['31', null, null, null, null, null, null],
  ];

  final List<Map<String, String>> holidayList = [
    {
      'title': 'Diwali',
      'date': '14th November',
      'day': 'Saturday',
    },
    {
      'title': 'Govardhan Puja',
      'date': '15th November',
      'day': 'Sunday',
    },
    {
      'title': 'Bhaiya Dooj',
      'date': '16th November',
      'day': 'Monday',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Holiday Calendar'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'NOVEMBER 2020',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su']
                    .map(
                      (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Center(
                      child: Text(
                        e,
                        style:
                        const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
                    .toList(),
              ),
              ...calendar.map((week) {
                return TableRow(
                  children: week.map((day) {
                    final isHoliday = holidayDates.contains(day);
                    final isSunday = sundays.contains(day);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Center(
                        child: day == null
                            ? const SizedBox.shrink()
                            : Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isHoliday
                                ? Colors.green
                                : isSunday
                                ? Colors.blue[100]
                                : null,
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            day,
                            style: TextStyle(
                              color: isHoliday || isSunday
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(thickness: 1),
          const Text(
            'List of Holidays',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: holidayList.length,
              itemBuilder: (context, index) {
                final holiday = holidayList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      holiday['title']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${holiday['date']} - ${holiday['day']}'),
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
