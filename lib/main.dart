import 'package:clinic_flutter_desktop_system/data.dart';
import 'package:clinic_flutter_desktop_system/state/provider.dart';
import 'package:flutter/material.dart';

import 'package:clinic_flutter_desktop_system/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ClinicApp());
}

class ClinicApp extends StatelessWidget {
  const ClinicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BodyModel(dbClients),
      builder: (context, _) => MaterialApp(
        title: 'Clinic-Flutter-Desktop-System',
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: init(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            return snapshot.hasData
                ? const HomePage()
                : const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
