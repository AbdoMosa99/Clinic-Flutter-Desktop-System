import 'package:clinic_flutter_desktop_system/components/attendance.dart';
import 'package:clinic_flutter_desktop_system/components/clients.dart';
import 'package:clinic_flutter_desktop_system/constants/colors.dart';
import 'package:clinic_flutter_desktop_system/data.dart';
import 'package:flutter/material.dart';
import 'package:textfield_search/textfield_search.dart';
import 'row.dart';
import 'table.dart';

class Body extends StatefulWidget {
  Widget child;
  String title;

  Body({
    key,
    required this.child,
    required this.title,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void update(Widget child, String title) {
    setState(() {
      widget.child = child;
      widget.title = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
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
                    child: Center(
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Container(
                        height: 45,
                        decoration: const BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: TextFieldSearch(
                            initialList: List.generate(
                              clients.length,
                              (i) => clients[i].name,
                            ),
                            label: "البحث عن عميل",
                            controller: TextEditingController(),
                            textStyle: const TextStyle(fontSize: 15.0),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 80.0,
                  ),
                  TextButton(
                    onPressed: () {
                      update(AttendanceBody(), "اليوم");
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8.0),
                      decoration: const BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      child: const Text(
                        "اليوم",
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      update(ClientsBody(), "الكل");
                    },
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
                      bottomLeft: Radius.circular(20.0))),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
