import 'package:flutter/cupertino.dart';
import 'package:clinic_flutter_desktop_system/constants/colors.dart';
import 'package:flutter/material.dart';

class AttendanceTable extends StatelessWidget {
  const AttendanceTable({
    Key? key,
    required this.rowsList,
    }) : super(key: key);

    final List<Widget> rowsList;

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
              children: rowsList
            ),
          )

        ],
      ),
    );
  }
}
