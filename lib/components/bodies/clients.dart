import 'package:clinic_flutter_desktop_system/components/table/table.dart';
import 'package:clinic_flutter_desktop_system/models/body_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientsBody extends StatelessWidget {
  const ClientsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BodyModel>(
      builder: (context, body, child) {
        List<String> header = ['كود', 'اسم العميل', 'رقم التليفون'];
        List<List<String>> rows = List.generate(
          body.clients.length,
          (i) {
            return [
              body.clients[i].id.toString(),
              body.clients[i].id.toString(),
              body.clients[i].name,
              body.clients[i].phone,
            ];
          },
        );
        return AppTable(header: header, rows: rows, cancelBtn: false);
      },
    );
  }
}
