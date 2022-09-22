import 'package:clinic_flutter_desktop_system/constants/colors.dart';
import 'package:clinic_flutter_desktop_system/database/models.dart';
import 'package:clinic_flutter_desktop_system/utility/date.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class AtttendDialog extends StatelessWidget {
  const AtttendDialog(this.client, {super.key});

  final Client client;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = TextEditingController(text: "تقويم");
    return Container(
      width: size.width * 1 / 3,
      height: size.height * 2 / 3,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Text("حضور"),
          Text(client.name),
          TextFormField(
            controller: controller,
          ),
          TextButton(
            onPressed: () {
              var attendance = Attendance(
                timestamp: TimeStamp(DateTime.now()),
                clientId: client.id,
                reason: controller.text,
              );
              db.insertAttendance(attendance);
              Navigator.pop(context);
            },
            child: Text("تسجيل"),
          )
        ],
      ),
    );
  }
}
