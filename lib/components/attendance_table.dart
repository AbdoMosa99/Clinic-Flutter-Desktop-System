import 'package:flutter/cupertino.dart';
import 'package:clinic_flutter_desktop_system/constants/colors.dart';
import 'package:flutter/material.dart';

import 'Row_attendance_table.dart';


class AttendanceTable extends StatefulWidget {
  const AttendanceTable({Key? key}) : super(key: key);

  @override
  _AttendanceTableState createState() => _AttendanceTableState();
}

class _AttendanceTableState extends State<AttendanceTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 40,
            color: AppColors.secondary,
            child: Row(
              children: const [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Text(
                      "الدور",
                      style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                          ),
                    ),
                  )
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "اسم العميل",
                    style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                    ),
                  )
                ),
                Expanded(
                flex: 2,
                  child: Text(
                    "السبب",
                    style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                    ),
                  )
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: 10
                  )
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                RowAttendanceTable(number: 1, name: "مصطفي امين جابر", reason: "تنظيف اسنان",),
                RowAttendanceTable(number: 2, name: "عبدالرحمن محمد موسي", reason: "متابعة تقويم",),
                RowAttendanceTable(number: 3, name: "احمد محروس اليمني", reason: "كشف",),

              ],
            ),
          )

        ],
      ),
    );
  }
}
