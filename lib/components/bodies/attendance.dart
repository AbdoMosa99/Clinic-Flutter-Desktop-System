import 'package:clinic_flutter_desktop_system/components/table/table.dart';
import 'package:clinic_flutter_desktop_system/models/body_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AttendanceBody extends StatelessWidget {
  const AttendanceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BodyModel>(
      builder: (context, body, child) {
        List<String> header = ['الدور', 'اسم العميل', 'السبب'];
        List<List<String>> rows = [];
        int n = 1;
        for (var i in body.attendance) {
          rows.add([
            body.clients[i].id.toString(),
            (n++).toString(),
            body.clients[i].name,
            body.clients[i].reason,
          ]);
        }
        return AppTable(header: header, rows: rows);
      },
    );
  }
}
