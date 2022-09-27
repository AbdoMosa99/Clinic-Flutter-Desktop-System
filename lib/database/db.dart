import 'dart:async';
import 'package:clinic_flutter_desktop_system/utility/date.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'models.dart';

class ClinicDatabase {
  late Database database;
  DatabaseFactory databaseFactory = databaseFactoryFfi;
  String dbPath = path.join('clinic.db');

  Future<void> open() async {
    database = await databaseFactory.openDatabase(dbPath);
    await database.execute(
      '''
        CREATE TABLE IF NOT EXISTS client (
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          name TEXT NOT NULL UNIQUE, 
          phone TEXT,
          present BOOLEAN DEFAULT false,
          totalAmount INTEGER NOT NULL CHECK (totalAmount >= 0),
          remainingAmount INTEGER NOT NULL CHECK (remainingAmount >= 0)
        )
      ''',
    );
    await database.execute(
      '''
        CREATE TABLE IF NOT EXISTS attendance (
          timestamp TEXT PRIMARY KEY,
          clientId INTEGER NOT NULL,
          reason TEXT
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

  Future<Client> insertClient(Client client) async {
    await database.insert(
      'client',
      client.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    final List<Map<String, dynamic>> maps = await database.query(
      'client',
      orderBy: 'id DESC',
      limit: 1
    );
    return Client.fromMap(maps[0]);
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

  Future<Payment> getDayPayment(TimeStamp timeStamp) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'payment',
      where: "timestamp = ?",
      whereArgs: [timeStamp.toString()],
    );
    return Payment.fromMap(maps[0]);
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

  Future<List<Attendance>> getAttendance(int clientId) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'attendance',
      where: "clientId = ?",
      whereArgs: [clientId],
    );

    return List.generate(maps.length, (i) {
      return Attendance.fromMap(maps[i]);
    });
  }

  /* Deleting */

  Future<void> deleteAttendance(Attendance attendance) async {
    await database.delete(
      'attendance',
      where: "timestamp = ?",
      whereArgs: [attendance.timestamp.toString()],
    );
  }

  Future<void> deletePayment(Payment payment) async {
    await database.delete(
      'payment',
      where: "timestamp = ?",
      whereArgs: [payment.timestamp.toString()],);
  }

  Future<void> deleteAll() async {
    await database.delete('client');
    await database.delete('attendance');
    await database.delete('payment');
  }

  Future<void> deleteClient(Client client) async {
    await database.delete(
      'client',
      where: "id = ?",
      whereArgs: [client.id.toString()],
    );
  }
}
