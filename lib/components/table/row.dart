import 'package:clinic_flutter_desktop_system/components/buttons/common_buttons.dart';
import 'package:flutter/material.dart';

class AppRow extends StatelessWidget {
  final List<String> values;
  final bool attendBtn;
  final bool payBtn;
  final bool cancelBtn;

  const AppRow({
    Key? key,
    required this.values,
    this.attendBtn = true,
    this.payBtn = true,
    this.cancelBtn = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(
      values.length,
      (i) {
        return Expanded(
          child: Text(
            values[i],
            style: const TextStyle(
              fontSize: 20.0,
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
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 100.0),
                    child: Row(
                      children: [
                        if (attendBtn)
                          Expanded(
                            child: AttendButton(id: values[0]),
                          ),
                        if (payBtn)
                          Expanded(
                            child: PayButton(id: values[0]),
                          ),
                        if (cancelBtn)
                          Expanded(
                            child: CancelButton(id: values[0]),
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
