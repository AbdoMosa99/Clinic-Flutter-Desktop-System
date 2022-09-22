import 'package:clinic_flutter_desktop_system/components/attend_dialog.dart';
import 'package:clinic_flutter_desktop_system/data.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppRow extends StatelessWidget {
  AppRow({
    Key? key,
    required this.values,
  }) : super(key: key);

  List<String> values;

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
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: AtttendDialog(
                                      clients.firstWhere(
                                          (e) => e.id.toString() == values[0]),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              width: 100,
                              height: 40,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 3.0),
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                              child: const Text(
                                "حضور",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog();
                                },
                              );
                            },
                            child: Container(
                              width: 100,
                              height: 40,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 3.0),
                              decoration: const BoxDecoration(
                                color: AppColors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                              child: const Text(
                                "دفع",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 3.0),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                              child: const Text(
                                "إلغاء",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
        Divider(color: Colors.black)
      ],
    );
  }
}
