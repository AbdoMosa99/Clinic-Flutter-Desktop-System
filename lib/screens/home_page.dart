import 'package:clinic_flutter_desktop_system/components/body.dart';
import 'package:clinic_flutter_desktop_system/components/header.dart';
import 'package:clinic_flutter_desktop_system/constants/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.primaryLight,
        body: Column(
          children: const [
            Expanded(
              flex: 1,
              child: Header(),
            ),
            Expanded(
              flex: 9,
              child: Body(
                child: Text(""),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
