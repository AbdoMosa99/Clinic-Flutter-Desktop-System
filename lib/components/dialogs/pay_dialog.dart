import 'package:clinic_flutter_desktop_system/constants/colors.dart';
import 'package:clinic_flutter_desktop_system/database/models.dart';
import 'package:clinic_flutter_desktop_system/utility/date.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data.dart';
import '../../models/body_model.dart';

class PayDialog extends StatelessWidget {
  const PayDialog(this.client, {super.key});

  final Client client;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var reasonController = TextEditingController(text: "تقويم");
    var moneyController = TextEditingController();

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
                flex: 0,
                child: Text(
                  "دفع الكشف",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  client.name,
                  style: const TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    controller: reasonController,
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
                      labelText: "سبب الدفع:",
                      labelStyle: const TextStyle(
                        fontSize: 18.0,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12.0)),
                            border: Border.all(
                              color: AppColors.primary,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              " المتبقي: ${client.remainingAmount}",
                              //owe == Null ? '0' : owe.remainingAmount,
                              style: const TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextFormField(
                        controller: moneyController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.primary, width: 2.0),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.grey, width: 2.0),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "المبلغ:",
                          labelStyle: const TextStyle(
                            fontSize: 18.0,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    Payment payment = Payment(
                        timestamp: TimeStamp(DateTime.now()),
                        clientId: client.id,
                        amount: int.parse(moneyController.text),
                        reason: reasonController.text);
                    Navigator.pop(context);
                    body.navigate("عميل");
                    await db.insertPayment(payment);
                    if (reasonController.text == "تقويم") {
                      client.remainingAmount -= int.parse(moneyController.text);
                      db.updateClient(client);
                      body.updateClient(client);
                    }
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
                        "دفع",
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
