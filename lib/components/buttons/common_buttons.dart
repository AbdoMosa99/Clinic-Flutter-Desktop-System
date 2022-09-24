import 'package:clinic_flutter_desktop_system/components/dialogs/attend_dialog.dart';
import 'package:clinic_flutter_desktop_system/constants/colors.dart';
import 'package:clinic_flutter_desktop_system/data.dart';
import 'package:clinic_flutter_desktop_system/database/models.dart';
import 'package:clinic_flutter_desktop_system/state/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dialogs/pay_dialog.dart';
import 'button.dart';

class AttendButton extends StatelessWidget {
  final String id;

  const AttendButton(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BodyModel>(
      builder: (context, body, child) {
        Client client = body.getClient(id);
        return AppButton(
          id: id,
          onPressed: () async {
            if (!client.present) {
              Owe owe = await db.getOwe(client.id);
              showDialog(
                context: context,
                builder: (context) {
                  return AtttendDialog(client, owe: owe,);
                },
              );
            } else {
              client.present = false;
              client.reason = "";
              db.updateClient(client);
              body.updateClient(client);
            }
          },
          bgColor: Colors.green,
          fgColor: Colors.white,
          text: client.present ? "✓" : "حضور",
        );
      },
    );
  }
}

class PayButton extends StatelessWidget {
  final String id;

  const PayButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    BodyModel body = Provider.of<BodyModel>(context);
    Client client = body.getClient(id);

    return AppButton(
      id: id,
      onPressed: () async {
        Owe owe = await db.getOwe(client.id);
        showDialog(
            context: context,
            builder: (context) {
              return PayDialog(client, owe: owe);
            },
        );
      },
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
    BodyModel body = Provider.of<BodyModel>(context);
    Client client = body.getClient(id);

    return AppButton(
      id: id,
      onPressed: () {},
      bgColor: Colors.red,
      fgColor: Colors.white,
      text: "إلغاء",
    );
  }
}
