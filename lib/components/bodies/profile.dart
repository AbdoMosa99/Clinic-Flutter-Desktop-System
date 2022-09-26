import 'package:clinic_flutter_desktop_system/components/table/table.dart';
import 'package:clinic_flutter_desktop_system/data.dart';
import 'package:clinic_flutter_desktop_system/database/models.dart';
import 'package:clinic_flutter_desktop_system/state/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utility/date.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
    required this.attendances,
    required this.payment
    });

  final List<dynamic> attendances;
  final List<dynamic> payment;

  @override
  Widget build(BuildContext context) {

    return Consumer<BodyModel>(
      builder: (context, body, child) {
        List<String> header = [' تاريخ', ' ساعة', ' اليوم', ' المبلغ'];
        List<List<String>> rows = List.generate(
          attendances.length,
          (i) {
            return [
              attendances[i].timestamp.date(),
              attendances[i].timestamp.hour(),
              attendances[i].timestamp.weekDay().toString(),
              payment.firstWhere(
                (e) => e.timestamp.date == attendances[i].timestamp.date(),
                orElse: (){
                  return Payment(
                    timestamp: TimeStamp(DateTime.now()),
                    clientId: 0,
                    amount: 0,
                    reason: ''
                  );
                }
              ).amount.toString()
            ];
          },
        );
        return Column(
          children: [
            Expanded(
              child: Container(

              )
            ),

            Expanded(
              flex: 3,
              child: AppTable(
                  header: header,
                  rows: rows,
                  cancelBtn: false,
                  attendBtn: false,
                  payBtn: false,
                  toProfile: true,
              ),
            )
          ],
        );

      },
    );
  }
}
