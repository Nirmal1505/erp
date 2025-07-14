import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tiles = [
      {
        'title': 'Attendance',
        'icon': Icons.event_available,
        'route': '/attendance',
      },
      {
        'title': 'Fees',
        'icon': Icons.payment,
        'route': '/fees', // ✅ Updated to navigate to FeesScreen
      },
      {
        'title': 'Result',
        'icon': Icons.assignment,
        'route': '/result',
      },
      {
        'title': 'School Holiday',
        'icon': Icons.beach_access,
        'route': '/holiday',
      },
      {
        'title': 'Events',
        'icon': Icons.event,
        'route': '/events',
      },
      {
        'title': 'Time table',
        'icon': Icons.calendar_today,
        'route': '/timetable',
      },
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF5B8DEE), Color(0xFF306FD8)]),
        ),
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: const CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
                    backgroundColor: Colors.white,
                  ),
                ),
                title: const Text("Hi Akshay", style: TextStyle(color: Colors.white, fontSize: 20)),
                subtitle: const Text("Class XI-B  |  Roll no: 04", style: TextStyle(color: Colors.white70)),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  icon: const Icon(Icons.logout, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              const Chip(label: Text("2020-2021")),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: GridView.builder(
                    itemCount: tiles.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      final tile = tiles[index];
                      return InkWell(
                        onTap: () {
                          if (tile['route'] != null) {
                            Navigator.pushNamed(context, tile['route']);
                          }
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(tile['icon'], size: 40, color: Colors.blue),
                              const SizedBox(height: 10),
                              Text(tile['title']),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
