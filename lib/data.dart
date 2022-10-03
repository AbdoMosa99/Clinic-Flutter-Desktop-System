import 'package:clinic_flutter_desktop_system/database/db.dart';

import 'database/models.dart';

late final ClinicDatabase db;
late List<Client> dbClients;

bool openProfile = false;

Future<bool> init() async {
  db = ClinicDatabase();
  // await db.databaseFactory.deleteDatabase(db.dbPath);
  // await insertData();
  await db.open();
  dbClients = await db.getClients();
  return true;
}
