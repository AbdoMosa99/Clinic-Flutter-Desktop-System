import 'package:clinic_flutter_desktop_system/constants/colors.dart';
import 'package:clinic_flutter_desktop_system/utility/date.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title = "مركز شريف البوهي";

  const Header({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppDate date = AppDate(DateTime.now());

    return Container(
      width: double.infinity,
      height: size.height / 10,
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)),
      ),
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              date.date(),
              style: const TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                child: const Text(
                  "يوم جديد",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
