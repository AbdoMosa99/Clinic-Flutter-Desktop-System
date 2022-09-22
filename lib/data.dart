import 'package:clinic_flutter_desktop_system/database/db.dart';
import 'package:clinic_flutter_desktop_system/database/temp.dart';

import 'database/models.dart';

late final ClinicDatabase db;
late List<Client> clients;

Future<bool> init() async {
  //insertData();
  db = ClinicDatabase();

  await db.open();

  clients = [];
  clients = await db.getClients();

  return true;
}
