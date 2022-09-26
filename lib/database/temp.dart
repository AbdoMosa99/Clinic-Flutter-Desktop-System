import '../utility/date.dart';
import 'db.dart';
import 'models.dart';

Future<void> insertData() async {
  final db = ClinicDatabase();
  await db.open();

  db.deleteAll();
  db.databaseFactory.deleteDatabase(db.dbPath);
  await db.open();

  Client client1 = Client(
    id: 1,
    name: 'مصطفى أمين',
    phone: '0112233445',
    present: false,
  );
  await db.insertClient(client1);

  Owe owe = Owe(
      timestamp: TimeStamp(DateTime.now()),
      clientId: client1.id,
      totalAmount: 0,
      remainingAmount: 0,
      reason: "البداية");
  db.insertOwe(owe);

  Client client2 = Client(
    id: 2,
    name: 'عبدالرحمن موسى',
    phone: '01067900157',
    present: false,
  );
  await db.insertClient(client2);

  Client client3 = Client(
    id: 3,
    name: 'كوثر أحمد',
    phone: '',
    present: false,
  );
  await db.insertClient(client3);

  Client client4 = Client(
    id: 4,
    name: 'عبدالسميع موسى',
    phone: '',
    present: false,
  );
  await db.insertClient(client4);
}
