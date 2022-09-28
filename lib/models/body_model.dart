import 'package:clinic_flutter_desktop_system/database/models.dart';
import 'package:flutter/material.dart';

class BodyModel extends ChangeNotifier {
  final List<Client> _clients;
  String _title = "اليوم";
  String? profileId;
  final List<int> _attendance = [];

  BodyModel(this._clients) {
    for (int i = 0; i < _clients.length; i++) {
      if (_clients[i].present) {
        _attendance.add(i);
      }
    }
  }

  List<Client> get clients => _clients;
  List<int> get attendance => _attendance;
  String get title => _title;

  void navigate(String title) {
    _title = title;
    notifyListeners();
  }

  void attend(Client client) {
    int index = _clients.indexWhere((e) => e.id == client.id);
    _attendance.add(index);
    notifyListeners();
  }

  void leave(Client client) {
    int index = _clients.indexWhere((e) => e.id == client.id);
    _attendance.remove(index);
    notifyListeners();
  }

  void updateClient(Client client) {
    int index = _clients.indexWhere((e) => e.id == client.id);
    _clients[index] = client;
    notifyListeners();
  }

  void deleteClient(Client client) {
    int index = _clients.indexWhere((e) => e.id == client.id);
    _clients.removeAt(index);
    _attendance.remove(index);
    for (int i = 0; i < _attendance.length; i++) {
      if (_attendance[i] > index) {
        _attendance[i]--;
      }
    }
    notifyListeners();
  }

  void addClient(Client client) {
    _clients.add(client);
    notifyListeners();
  }

  Client getClient(String id) {
    return _clients.firstWhere(
      (e) => e.id.toString() == id,
    );
  }
}
