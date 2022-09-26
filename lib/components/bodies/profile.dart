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
      attendances = await db.getAttendance(clientId);
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
                      ' ساعة',
                      ' اليوم',
                      ' المبلغ'
                    ];
                    List<List<String>> rows = List.generate(
                      attendances.length,
                      (i) {
                        return [
                          attendances[i].timestamp.date(),
                          attendances[i].timestamp.hour(),
                          attendances[i].timestamp.weekDay().toString(),
                          payments
                              .firstWhere(
                                  (e) =>
                                      e.timestamp.date ==
                                      attendances[i].timestamp.date(),
                                  orElse: () {
                                return Payment(
                                    timestamp: TimeStamp(DateTime.now()),
                                    clientId: 0,
                                    amount: 0,
                                    reason: '');
                              })
                              .amount
                              .toString()
                        ];
                      },
                    );
                    return Column(
                      children: [
                        Expanded(child: Container()),
                        Expanded(
                          flex: 3,
                          child: AppTable(
                            header: header,
                            rows: rows,
                            cancelBtn: false,
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
