import 'db.dart';
import 'models.dart';

Future<void> insertData() async {
  final database = ClinicDatabase();
  await database.open();

  Client client1 = Client(
    name: 'مصطفى أمين',
    phone: '0112233445',
    present: false,
  );
  await database.insertClient(client1);

  Client client2 = Client(
    name: 'عبدالرحمن موسى',
    phone: '01067900157',
    present: false,
  );
  await database.insertClient(client2);

  Client client3 = Client(
    name: 'كوثر أحمد',
    phone: '',
    present: false,
  );
  await database.insertClient(client3);

  Client client4 = Client(
    name: 'عبدالسميع موسى',
    phone: '',
    present: false,
  );
  await database.insertClient(client4);
}
