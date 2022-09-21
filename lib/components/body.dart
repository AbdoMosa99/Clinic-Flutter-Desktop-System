import 'package:clinic_flutter_desktop_system/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:textfield_search/textfield_search.dart';

import 'attendance_table.dart';

class Body extends StatelessWidget {
  final Widget child;

  const Body({key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(20.0),
      height: size.height*9 / 10,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    width: 120.0,
                    height: 70.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.0),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "اليوم",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: const BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.all(
                         Radius.circular(6.0)
                        ),
                    ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: TextFieldSearch(
                          initialList: const [
                            'مصطفي امين',
                            'عبدالرحمن موسي',
                            'عبدالرحمن مساعد',
                            'احمد محروس',
                            'احمد عبدالغني',
                            'منة الشاذلي',
                            'كوثر احمد',
                            'منار شاهين',
                            'مصطفي سعد',
                          ],
                          label: "البحث عن عميل",
                          controller: TextEditingController(),
                          textStyle: const TextStyle(
                            fontSize: 15.0
                          ),
                        ),

                      )

                    ),
                  ),
                  SizedBox(
                    width: 80.0,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8.0),
                      decoration: const BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      child: const Text(
                        "كل العملاء",
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8.0),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      child: const Text(
                        "إضافة عميل",
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0)
                      )
              ),
              child: AttendanceTable()
              ),
            ),
        ],
      ),
    );
  }
}
