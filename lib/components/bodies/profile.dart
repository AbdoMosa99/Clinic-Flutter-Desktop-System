import 'package:clinic_flutter_desktop_system/components/table/table.dart';
import 'package:clinic_flutter_desktop_system/data.dart';
import 'package:clinic_flutter_desktop_system/database/models.dart';
import 'package:clinic_flutter_desktop_system/models/body_model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../../utility/date.dart';

class ProfileBody extends StatelessWidget {
  ProfileBody({super.key});

  late final List<Attendance> attendances;
  late final List<Payment> payments;

  @override
  Widget build(BuildContext context) {
    Future<bool> getProfile() async {
      int clientId = int.parse(Provider.of<BodyModel>(context).profileId!);
      //attendances = await db.getAttendance(clientId);
      payments = await db.getPayments(clientId);
      return true;
    }

    return FutureBuilder(
        future: getProfile(),
        builder: (context, AsyncSnapshot<void> snapshot) {
          return snapshot.hasData
              ? Consumer<BodyModel>(
                  builder: (context, body, child) {
                    List<String> header = [
                      ' تاريخ',
                      'ساعة',
                      'اليوم',
                      'السبب',
                      'المبلغ',
                      '      '
                    ];
                    List<List<String>> rows = payments.reversed.map((payment) {
                      return [
                        payment.timestamp.date(),
                        payment.timestamp.hour(),
                        payment.timestamp.weekDay(),
                        payment.reason,
                        payment.amount.toString(),
                        payment.timestamp.toString(),
                      ];
                    }).toList();
                    return Column(
                      children: [
                        Expanded(child: Container()),
                        Expanded(
                          flex: 3,
                          child: AppTable(
                            header: header,
                            rows: rows,
                            cancelBtn: true,
                            attendBtn: false,
                            payBtn: false,
                            isProfile: true,
                          ),
                        )
                      ],
                    );
                  },
                )
              : CircularProgressIndicator();
        });
  }
}
