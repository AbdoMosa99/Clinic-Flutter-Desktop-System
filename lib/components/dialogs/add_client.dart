import 'package:clinic_flutter_desktop_system/constants/colors.dart';
import 'package:clinic_flutter_desktop_system/database/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data.dart';
import '../../models/body_model.dart';

class AddClientDialog extends StatelessWidget {
  const AddClientDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var nameController = TextEditingController();
    var numberController = TextEditingController();

    return Consumer<BodyModel>(builder: (context, body, child) {
      return Dialog(
        child: Container(
          width: size.width * 1 / 3,
          height: size.height * 2 / 3,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: [
              const Expanded(
                child: Text(
                  "إضافة عميل جديد",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.grey, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "الاسم:",
                      labelStyle: const TextStyle(
                        fontSize: 18.0,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    controller: numberController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.primary, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "رقم الهاتف:",
                        labelStyle: const TextStyle(
                            fontSize: 18.0, color: AppColors.primary,),),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    Client client = Client(
                        name: nameController.text,
                        phone: numberController.text);
                    Navigator.pop(context);
                    client = await db.insertClient(client);
                    body.addClient(client);
                  },
                  child: Container(
                    width: 120.0,
                    height: 50.0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8.0),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "إضافة",
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
