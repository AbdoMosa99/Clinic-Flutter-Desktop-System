import 'package:clinic_flutter_desktop_system/database/db.dart';
import 'package:clinic_flutter_desktop_system/database/temp.dart';

import 'database/models.dart';

late final ClinicDatabase db;
late List<Client> dbClients;

bool openProfile = false;
List<dynamic> gAttendance = [];
List<dynamic> gpayment = [];

Future<bool> init() async {
  //await db.deleteAll();
  //await insertData();
  db = ClinicDatabase();
  await db.open();
  dbClients = await db.getClients();

  return true;
}
