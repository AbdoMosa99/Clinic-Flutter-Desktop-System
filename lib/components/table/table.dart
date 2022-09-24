import 'package:clinic_flutter_desktop_system/components/table/row.dart';
import 'package:clinic_flutter_desktop_system/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTable extends StatelessWidget {
  final List<List<String>> rows;
  final List<String> header;
  final bool attendBtn;
  final bool payBtn;
  final bool cancelBtn;

  const AppTable({
    Key? key,
    required this.header,
    required this.rows,
    this.attendBtn = true,
    this.payBtn = true,
    this.cancelBtn = true,
  }) : super(key: key);

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
              children: [
                ...List.generate(
                  header.length,
                  (i) {
                    return Expanded(
                      child: Text(
                        header[i],
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
                const Expanded(flex: 2, child: SizedBox(width: 10))
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: List.generate(
                rows.length,
                (i) {
                  return AppRow(
                    values: rows[i],
                    attendBtn: attendBtn,
                    payBtn: payBtn,
                    cancelBtn: cancelBtn,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
