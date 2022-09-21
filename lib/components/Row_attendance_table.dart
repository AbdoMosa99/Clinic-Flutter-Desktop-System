import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
class RowAttendanceTable extends StatelessWidget {

  RowAttendanceTable({
      Key? key,
      required this.number,
      required this.name,
      required this.reason
    }) : super(key: key);

  int number;
  String name;
  String reason;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 40,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    number.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                    reason,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(right: 100.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            width: 100,
                            height: 40,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 3.0),
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
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
                          onPressed: () {},
                          child: Container(
                            width: 100,
                            height: 40,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 3.0),
                            decoration: const BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
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
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
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
                )
              )

            ],
          ),
        ),
        Divider(
            color: Colors.black
        )
      ],
    );
  }
}
