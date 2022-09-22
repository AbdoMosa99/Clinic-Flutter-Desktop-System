import 'package:clinic_flutter_desktop_system/components/table/table.dart';
import 'package:flutter/material.dart';

import '../../data.dart';

class AttendanceBody extends StatelessWidget {
  const AttendanceBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> header = ['الدور', 'اسم العميل', 'السبب'];

    Future<List<List<String>>> getRows() async {
      var attendance = await db.getAttendance();
      print(attendance);
      int n = 1;
      return List.generate(
        attendance.length,
        (i) {
          return [
            (n++).toString(),
            clients.firstWhere((e) => e.id == attendance[i].clientId).name,
            attendance[i].reason,
          ];
        },
      );
    }

    return FutureBuilder(
      future: getRows(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        return snapshot.hasData
            ? AppTable(
                header: header, rows: snapshot.data as List<List<String>>)
            : const CircularProgressIndicator();
      },
    );
  }
}
