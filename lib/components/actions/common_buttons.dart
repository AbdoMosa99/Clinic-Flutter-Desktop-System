import 'package:clinic_flutter_desktop_system/components/dialogs/attend_dialog.dart';
import 'package:clinic_flutter_desktop_system/components/dialogs/confirm_delete_dialog.dart';
import 'package:clinic_flutter_desktop_system/components/dialogs/delete_client.dart';
import 'package:clinic_flutter_desktop_system/components/dialogs/edit_client.dart';
import 'package:clinic_flutter_desktop_system/components/dialogs/owe_dialog.dart';
import 'package:clinic_flutter_desktop_system/constants/colors.dart';
import 'package:clinic_flutter_desktop_system/data.dart';
import 'package:clinic_flutter_desktop_system/database/models.dart';
import 'package:clinic_flutter_desktop_system/models/body_model.dart';
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
              body.leave(client);
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
        showDialog(
          context: context,
          builder: (context) {
            return PayDialog(client);
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
  final bool isProfile;

  const CancelButton({
    super.key,
    required this.id,
    this.isProfile = false,
  });

  @override
  Widget build(BuildContext context) {
    BodyModel body = Provider.of<BodyModel>(context);

    return TextButton(
        onPressed: () async {
          if (!isProfile) {
            Client client = body.getClient(id);

            client.present = false;
            client.reason = "";
            body.leave(client);
            await db.updateClient(client);
            body.updateClient(client);

            List<Attendance> attendances =
                await db.getAttendance(int.parse(id));

            Attendance lastAttendance = attendances[0];
            for (int i = 1; i < attendances.length; i++) {
              var lastDate = lastAttendance.timestamp.dateTime;
              var currentDate = attendances[i].timestamp.dateTime;
              if (currentDate.isAfter(lastDate)) {
                lastAttendance = attendances[i];
              }
            }
            await db.deleteAttendance(lastAttendance);
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return ConfirmDeleteDialog(
                  timeStamp: id,
                );
              },
            );
          }
        },
        child: Image.asset('assets/images/delete_icon.png'));
  }
}

class MakeOweButton extends StatelessWidget {
  final String id;

  const MakeOweButton(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    BodyModel body = Provider.of<BodyModel>(context);
    Client client = body.getClient(id);

    return AppButton(
      id: id,
      onPressed: () async {
        showDialog(
          context: context,
          builder: (context) {
            return OweDialog(client);
          },
        );
      },
      bgColor: AppColors.grey,
      fgColor: Colors.black,
      text: "عمل",
    );
  }
}

class EditClientButton extends StatelessWidget {
  final String id;

  const EditClientButton(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    BodyModel body = Provider.of<BodyModel>(context);
    Client client = body.getClient(id);

    return AppButton(
      id: id,
      onPressed: () async {
        showDialog(
          context: context,
          builder: (context) {
            return EditClientDialog(client);
          },
        );
      },
      bgColor: AppColors.grey,
      fgColor: Colors.black,
      text: "تعديل",
    );
  }
}

class DeleteClientButton extends StatelessWidget {
  final String id;
  const DeleteClientButton(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    BodyModel body = Provider.of<BodyModel>(context);
    Client client = body.getClient(id);

    return AppButton(
      id: id,
      onPressed: () async {
        showDialog(
          context: context,
          builder: (context) {
            return DeleteClientDialog(client);
          },
        );
      },
      bgColor: AppColors.primary,
      fgColor: Colors.white,
      text: "حذف",
    );
  }
}
