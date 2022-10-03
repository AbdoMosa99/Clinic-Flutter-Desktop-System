import 'package:clinic_flutter_desktop_system/components/actions/search.dart';
import 'package:clinic_flutter_desktop_system/components/bodies/attendance.dart';
import 'package:clinic_flutter_desktop_system/components/bodies/clients.dart';
import 'package:clinic_flutter_desktop_system/components/bodies/profile.dart';
import 'package:clinic_flutter_desktop_system/constants/colors.dart';
import 'package:clinic_flutter_desktop_system/models/body_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dialogs/add_client.dart';

class Body extends StatefulWidget {
  const Body({key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BodyModel>(
      builder: (context, body, _) => Container(
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
                          body.title,
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
                        child: Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Consumer<BodyModel>(
                        builder: (context, body, child) => const SearchField(),
                      ),
                    )),
                    const SizedBox(
                      width: 80.0,
                    ),
                    TextButton(
                      onPressed: () {
                        body.navigate("اليوم");
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35.0, vertical: 8.0),
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
                        body.navigate("الكل");
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
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AddClientDialog();
                          },
                        );
                      },
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
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
                child: (body.title == "اليوم")
                    ? const AttendanceBody()
                    : (body.title == "الكل")
                        ? const ClientsBody()
                        : ProfileBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
