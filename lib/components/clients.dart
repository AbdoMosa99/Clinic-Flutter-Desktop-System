import 'package:clinic_flutter_desktop_system/components/table.dart';
import 'package:clinic_flutter_desktop_system/data.dart';
import 'package:flutter/material.dart';

class ClientsBody extends StatelessWidget {
  const ClientsBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> header = ['كود', 'اسم العميل', "رقم التليفون"];
    List<List<String>> rows = List.generate(
      clients.length,
      (i) {
        return clients[i].toList();
      },
    );
    return AppTable(header: header, rows: rows);
  }
}
