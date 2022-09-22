import 'dart:async';
import 'package:path/path.dart' as path;
//import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'models.dart';

class ClinicDatabase {
  late Database database;

  Future<void> open() async {
    //sqfliteFfiInit();
    var databaseFactory = databaseFactoryFfi;
    database = await databaseFactory.openDatabase(path.join('clinic.db'));


    await database.execute(
      '''
        CREATE TABLE IF NOT EXISTS client (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT NOT NULL UNIQUE, 
        phone TEXT,
        present BOOLEAN DEFAULT false
      )
      ''',
    );
    await database.execute(
      '''
        CREATE TABLE IF NOT EXISTS attendance(
          timestamp TEXT PRIMARY KEY,
          clientId INTEGER NOT NULL
        )
      ''',
    );
    await database.execute(
      '''
        CREATE TABLE IF NOT EXISTS owe(
        timestamp TEXT PRIMARY KEY,
        clientId INTEGER NOT NULL,
        totalAmount INTEGER NOT NULL CHECK (totalAmount >= 0),
        remainingAmount INTEGER NOT NULL CHECK (remainingAmount >= 0),
        reason TEXT NOT NULL
      )
      ''',
    );
    await database.execute(
      '''
        CREATE TABLE IF NOT EXISTS payment(
          timestamp TEXT PRIMARY KEY,
          clientId INTEGER NOT NULL,
          amount INTEGER NOT NULL CHECK (amount >= 0), 
          reason TEXT
        )
      ''',
    );

  }

  /* Inserting Into DB */

  Future<void> insertClient(Client client) async {
    await database.insert(
      'client',
      client.toMap(),
    );
  }

  Future<void> insertOwe(Owe owe) async {
    await database.insert(
      'owe',
      owe.toMap(),
    );
  }

  Future<void> insertPayment(Payment payment) async {
    await database.insert(
      'payment',
      payment.toMap(),
    );
  }

  Future<void> insertAttendance(Attendance attendance) async {
    await database.insert(
      'attendance',
      attendance.toMap(),
    );
  }

  /* Updating Records */

  Future<void> updateClient(Client client) async {
    await database.update(
      'client',
      client.toMap(),
      where: 'id = ?',
      whereArgs: [client.id],
    );
  }

  Future<void> updateOwe(Owe owe) async {
    await database.update(
      'owe',
      owe.toMap(),
      where: 'timestamp = ?',
      whereArgs: [owe.timestamp.toString()],
    );
  }

  /* Getting From database */

  Future<Client> getClient(int id) async {
    List<Map<String, dynamic>> maps = await database.query(
      'client',
      where: "id = ?",
      whereArgs: [id],
    );

    return Client.fromMap(maps[0]);
  }

  Future<List<Client>> getClients() async {
    final List<Map<String, dynamic>> maps = await database.query(
      'client',
    );

    return List.generate(maps.length, (i) => Client.fromMap(maps[i]));
  }

  Future<Owe> getOwe(int clientId) async {
    List<Map<String, dynamic>> maps = await database.query(
      'owe',
      where: "clientId = ?",
      whereArgs: [clientId],
    );

    return Owe.fromMap(maps[0]);
  }

  Future<List<Payment>> getPayments(int clientId) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'payment',
      where: "clientId = ?",
      whereArgs: [clientId],
    );

    return List.generate(maps.length, (i) {
      return Payment.fromMap(maps[i]);
    });
  }

  Future<List<Payment>> getDayPayments(DateTime dateTime) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'payment',
      where: "timestamp LIKE ?",
      whereArgs: [dateTime.toString().substring(0, 10)],
    );

    return List.generate(maps.length, (i) {
      return Payment.fromMap(maps[i]);
    });
  }

  Future<List<Attendance>> getDayAttendance(DateTime dateTime) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'attendance',
      where: "timestamp LIKE ?",
      whereArgs: [dateTime.toString().substring(0, 10)],
    );

    return List.generate(maps.length, (i) {
      return Attendance.fromMap(maps[i]);
    });
  }

  /* Deleting */

  Future<void> deleteAll() async {
    await database.delete('client');

    await database.delete('attendance');

    await database.delete('owe');

    await database.delete('payment');
  }
}
