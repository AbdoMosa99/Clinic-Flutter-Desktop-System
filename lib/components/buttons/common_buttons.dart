import 'package:clinic_flutter_desktop_system/components/dialogs/attend_dialog.dart';
import 'package:clinic_flutter_desktop_system/constants/colors.dart';
import 'package:clinic_flutter_desktop_system/data.dart';
import 'package:clinic_flutter_desktop_system/database/models.dart';
import 'package:flutter/material.dart';

import 'button.dart';

class AttendButton extends StatelessWidget {
  final String id;

  const AttendButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Client client = clients.firstWhere(
      (e) => e.id.toString() == id,
    );
    return AppButton(
      id: id,
      onPressed: () {
        if (!client.present) {
          showDialog(
            context: context,
            builder: (context) {
              return AtttendDialog(client);
            },
          );
        } else {
          client.present = false;
          client.reason = "";
          db.updateClient(client);
        }
      },
      bgColor: Colors.green,
      fgColor: Colors.white,
      text: client.present ? "✓" : "حضور",
    );
  }
}

class PayButton extends StatelessWidget {
  final String id;

  const PayButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Client client = clients.firstWhere(
      (e) => e.id.toString() == id,
    );
    return AppButton(
      id: id,
      onPressed: () {},
      bgColor: AppColors.grey,
      fgColor: Colors.black,
      text: "دفع",
    );
  }
}

class CancelButton extends StatelessWidget {
  final String id;

  const CancelButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Client client = clients.firstWhere(
      (e) => e.id.toString() == id,
    );
    return AppButton(
      id: id,
      onPressed: () {},
      bgColor: Colors.red,
      fgColor: Colors.white,
      text: "إلغاء",
    );
  }
}
