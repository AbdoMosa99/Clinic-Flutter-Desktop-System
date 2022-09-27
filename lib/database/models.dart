import 'package:clinic_flutter_desktop_system/utility/date.dart';

class Client {
  final int id;
  String name;
  String phone;
  bool present;
  String reason;
  int totalAmount;
  int remainingAmount;

  Client({
    this.id = 0,
    required this.name,
    required this.phone,
    this.present = false,
    this.reason = "",
    this.totalAmount = 0,
    this.remainingAmount = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'present': present ? 1 : 0,
      'totalAmount': totalAmount,
      'remainingAmount': remainingAmount,
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      present: map['present'] == 1,
      totalAmount: map['totalAmount'],
      remainingAmount: map['remainingAmount'],
    );
  }

  @override
  String toString() {
    return 'Client<name: $name, phone: $phone>';
  }

  List<String> toList() {
    return [
      id.toString(),
      name,
      phone,
    ];
  }
}

class Attendance {
  final TimeStamp timestamp;
  final int clientId;
  String reason;

  Attendance({
    required this.timestamp,
    required this.clientId,
    this.reason = "",
  });

  Map<String, dynamic> toMap() {
    return {
      'timestamp': timestamp.toString(),
      'clientId': clientId,
      'reason': reason,
    };
  }

  factory Attendance.fromMap(Map<String, dynamic> map) {
    return Attendance(
      timestamp: TimeStamp.fromString(map['timestamp']),
      clientId: map['clientId'],
      reason: map['reason'],
    );
  }

  List<dynamic> toList() {
    return [timestamp, clientId, reason];
  }

  @override
  String toString() {
    return 'Attendance<timestamp: $timestamp, client: $clientId, reason: $reason>';
  }
}

class Payment {
  final TimeStamp timestamp;
  final int clientId;
  int amount;
  String reason;

  Payment({
    required this.timestamp,
    required this.clientId,
    required this.amount,
    required this.reason,
  });

  Map<String, dynamic> toMap() {
    return {
      'timestamp': timestamp.toString(),
      'clientId': clientId,
      'amount': amount,
      'reason': reason,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      timestamp: TimeStamp.fromString(map['timestamp']),
      clientId: map['clientId'],
      amount: map['amount'],
      reason: map['reason'],
    );
  }

  @override
  String toString() {
    return 'Payment<timestamp: $timestamp, client: $clientId, amount: $amount, reason: $reason>';
  }
}
