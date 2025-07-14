import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  final List<Map<String, String>> results = const [
    {'subject': 'English', 'total': '100', 'score': '74', 'grade': 'B'},
    {'subject': 'Hindi', 'total': '100', 'score': '87', 'grade': 'B'},
    {'subject': 'Science', 'total': '100', 'score': '74', 'grade': 'B'},
    {'subject': 'Math', 'total': '100', 'score': '87', 'grade': 'B'},
    {'subject': 'Social Study', 'total': '100', 'score': '89', 'grade': 'B'},
    {'subject': 'Drawing', 'total': '100', 'score': '78', 'grade': 'B'},
    {'subject': 'Computer', 'total': '100', 'score': '96', 'grade': 'A'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3A89FF), Color(0xFF6CC5FF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.only(top: 60, bottom: 20, left: 16, right: 16),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context); // Go back
                    },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: Text(
                            '85%',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'GRADE A',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'You are Excellent,',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const Text(
                      'AKSHAY SYAL !!',
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: results.map((subject) {
                        return ListTile(
                          title: Text(subject['subject']!),
                          leading: Text(subject['total']!, style: const TextStyle(color: Colors.grey)),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(subject['score']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: subject['grade'] == 'A' ? Colors.green[100] : Colors.blue[100],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(subject['grade']!, style: const TextStyle(fontSize: 12)),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3A89FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    onPressed: () {
                      // PDF download logic here
                    },
                    icon: const Icon(Icons.download),
                    label: const Text("DOWNLOAD PDF"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
