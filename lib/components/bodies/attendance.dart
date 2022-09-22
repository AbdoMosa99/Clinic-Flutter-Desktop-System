import 'package:clinic_flutter_desktop_system/components/table/table.dart';
import 'package:flutter/material.dart';

import 'package:clinic_flutter_desktop_system/data.dart';

class AttendanceBody extends StatelessWidget {
  const AttendanceBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> header = ['الدور', 'اسم العميل', 'السبب'];

    List<List<String>> rows = [];
    for (int i = 0; i < clients.length; i++) {
      if (clients[i].present) {
        rows.add([
          clients[i].id.toString(),
          clients[i].name,
          clients[i].reason,
        ]);
      }
    }
    return AppTable(header: header, rows: rows);
  }
}
