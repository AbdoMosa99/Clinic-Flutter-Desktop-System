import 'package:clinic_flutter_desktop_system/components/bodies/attendance.dart';
import 'package:clinic_flutter_desktop_system/components/bodies/profile.dart';
import 'package:clinic_flutter_desktop_system/components/main/body.dart';
import 'package:clinic_flutter_desktop_system/components/main/header.dart';
import 'package:clinic_flutter_desktop_system/constants/colors.dart';
import 'package:clinic_flutter_desktop_system/data.dart';
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
          children: [
            const Expanded(
              flex: 1,
              child: Header(),
            ),
            Expanded(
              flex: 9,
              child: !openProfile ? Body(
                title: "اليوم",
                child: const AttendanceBody(),
              ) : Body(
                title: "الملف",
                child: ProfileBody(attendances: gAttendance, payment: gpayment,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
