import 'package:flutter/material.dart';

import 'package:clinic_flutter_desktop_system/screens/home_page.dart';

void main() {
  runApp(const ClinicApp());
}

class ClinicApp extends StatelessWidget {
  const ClinicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Clinic-Flutter-Desktop-System',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
