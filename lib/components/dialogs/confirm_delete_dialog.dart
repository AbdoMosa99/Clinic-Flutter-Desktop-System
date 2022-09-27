import 'package:clinic_flutter_desktop_system/components/actions/button.dart';
import 'package:clinic_flutter_desktop_system/constants/colors.dart';
import 'package:clinic_flutter_desktop_system/database/models.dart';
import 'package:clinic_flutter_desktop_system/utility/date.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data.dart';
import '../../models/body_model.dart';

class ConfirmDeleteDialog extends StatelessWidget {
  const ConfirmDeleteDialog({super.key, required this.timeStamp, });

  final String timeStamp;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<BodyModel>(builder: (context, body, child) {
      return Dialog(
        child: Container(
          width: size.width * 2 / 3,
          height: size.height * 1 / 3,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: const Text(
                  "حذف عملية دفع",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
              flex: 1,
                child: Text(
                  "هل متأكد أنك تريد حذف عملية الدفع هذه",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      id : '0',
                      bgColor: Colors.grey,
                      fgColor: Colors.black,
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      text: 'إلغاء',
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: AppButton(
                      id : '0',
                      bgColor: Colors.red,
                      fgColor: Colors.white,
                      onPressed: () async{
                        Navigator.pop(context);

                        db.deletePayment(await db.getDayPayment(TimeStamp.fromString(timeStamp))) ;

                        BodyModel bodyModel = Provider.of<BodyModel>(context, listen: false);
                        bodyModel.navigate("عميل");
                      },
                      text: 'حذف',
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      );
    });
  }
}
