import 'package:clinic_flutter_desktop_system/constants/colors.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Widget child;

  const Body({key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: 100.0,
                  height: 80.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.0),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "عميل",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    color: AppColors.grey,
                  ),
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
          Container(
            width: double.infinity,
            height: 600.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
