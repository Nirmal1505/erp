import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profileImage;

  final List<Map<String, String>> profileFields = [
    {'label': 'Adhar No', 'value': '1234 4325 4567 1234'},
    {'label': 'Academic Year', 'value': '2020-2021'},
    {'label': 'Admission Class', 'value': 'VI'},
    {'label': 'Old Admission No', 'value': 'T00221'},
    {'label': 'Date of Admission', 'value': '01 Apr 2018'},
    {'label': 'Date of Birth', 'value': '22 July 1996'},
    {'label': 'Parent Mail ID', 'value': 'parentboth84@gmail.com'},
    {'label': 'Mother Name', 'value': 'Monica Larson'},
    {'label': 'Father Name', 'value': 'Bernard Taylor'},
    {'label': 'Permanent Add.', 'value': 'Karol Bagh, Delhi'},
  ];

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, left: 16, right: 16, bottom: 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF5B8DEE), Color(0xFF306FD8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text("My Profile",
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/dashboard');
                      },
                      icon: const Icon(Icons.check),
                      label: const Text("Done"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color(0xFF306FD8),
                        shape: const StadiumBorder(),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                          backgroundColor: Colors.grey[300],
                          child: _profileImage == null
                              ? const Icon(Icons.person, size: 40, color: Colors.white)
                              : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: const CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.camera_alt, size: 16, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Akshay Syal",
                            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text("Class XI-B  |  Roll no: 04",
                            style: TextStyle(fontSize: 14, color: Colors.white70)),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: List.generate(profileFields.length, (index) {
                  final field = profileFields[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: TextFormField(
                      initialValue: field['value'],
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: field['label'],
                        suffixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                    ),
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
