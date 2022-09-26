import 'package:clinic_flutter_desktop_system/components/actions/common_buttons.dart';
import 'package:flutter/material.dart';

import '../../data.dart';
import '../../database/models.dart';
import '../../screens/home_page.dart';

class AppRow extends StatefulWidget {
  final List<String> values;
  final bool attendBtn;
  final bool payBtn;
  final bool cancelBtn;
  final bool toProfile;

  const AppRow({
    Key? key,
    required this.values,
    this.attendBtn = true,
    this.payBtn = true,
    this.cancelBtn = true,
    this.toProfile = false,
  }) : super(key: key);

  @override
  State<AppRow> createState() => _AppRowState();
}

class _AppRowState extends State<AppRow> {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(
      widget.values.length,
      (i) {
        return Expanded(
          child: TextButton(
            onPressed: () async {
              List<dynamic> attendance =
                  await db.getAttendance(int.parse(widget.values[0]));
              List<dynamic> payments =
                  await db.getPayments(attendance[0].clientId);

              if (!widget.toProfile) {
                openProfile = true;
                gAttendance = attendance;
                gpayment = payments;

                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        HomePage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              }
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.values[i],
                style: const TextStyle(fontSize: 20.0, color: Colors.black),
              ),
            ),
          ),
        );
      },
    );

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 40,
          child: Row(
            children: [
              ...items,
              Expanded(
                  flex: widget.toProfile ? 0 : 2,
                  child: Padding(
                    padding:
                        EdgeInsets.only(right: widget.toProfile ? 0 : 100.0),
                    child: Row(
                      children: [
                        if (widget.attendBtn)
                          Expanded(
                            child: AttendButton(widget.values[0]),
                          ),
                        if (widget.payBtn)
                          Expanded(
                            child: PayButton(id: widget.values[0]),
                          ),
                        if (widget.cancelBtn)
                          Expanded(
                            child: CancelButton(id: widget.values[0]),
                          ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
        const Divider(color: Colors.black)
      ],
    );
  }
}
