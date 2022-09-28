import 'package:clinic_flutter_desktop_system/components/actions/common_buttons.dart';
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

  final List<Payment> payments = [];

  @override
  Widget build(BuildContext context) {
    BodyModel body = Provider.of<BodyModel>(context);
    int clientId = int.parse(body.profileId!);
    Client client = body.getClient(body.profileId!);

    Future<bool> getProfile() async {
      int clientId = int.parse(Provider.of<BodyModel>(context).profileId!);

      payments.clear();
      payments.insertAll(0, await db.getPayments(clientId));
      return true;
    }

    return Column(
      children: [
        Container(
          child: Column(
            children: [
              SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Info(
                          label: "الاسم",
                          value: client.name,
                        ),
                        Info(
                          label: "الإجمالي",
                          value: client.totalAmount.toString(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Info(
                          label: "رقم الهاتف",
                          value: client.phone,
                        ),
                        Info(
                          label: "المتبقي",
                          value: client.remainingAmount.toString(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                child: Row(
                  children: [
                    AttendButton(client.id.toString()),
                    PayButton(id: client.id.toString()),
                    const Expanded(child: SizedBox()),
                    MakeOweButton(client.id.toString()),
                    EditClientButton(client.id.toString()),
                    DeleteClientButton(client.id.toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: getProfile(),
            builder: (context, AsyncSnapshot<void> snapshot) {
              return snapshot.hasData
                  ? Consumer<BodyModel>(
                      builder: (context, body, child) {
                        List<String> header = [
                          'تاريخ',
                          'ساعة',
                          'اليوم',
                          'السبب',
                          'المبلغ',
                        ];
                        List<List<String>> rows =
                            payments.reversed.map((payment) {
                          return [
                            payment.timestamp.toString(),
                            payment.timestamp.date(),
                            payment.timestamp.hour(),
                            payment.timestamp.weekDay(),
                            payment.reason,
                            payment.amount.toString(),
                          ];
                        }).toList();
                        return AppTable(
                          header: header,
                          rows: rows,
                          cancelBtn: true,
                          attendBtn: false,
                          payBtn: false,
                          isProfile: true,
                        );
                      },
                    )
                  : CircularProgressIndicator();
            },
          ),
        )
      ],
    );
  }
}

class Info extends StatelessWidget {
  final String label;
  final String value;
  const Info({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
