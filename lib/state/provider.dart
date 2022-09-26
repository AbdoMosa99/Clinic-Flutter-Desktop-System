import 'package:clinic_flutter_desktop_system/database/models.dart';
import 'package:flutter/foundation.dart';

class BodyModel extends ChangeNotifier {
  final List<Client> _clients;

  BodyModel(this._clients);

  List<Client> get clients => _clients;

  void updateClient(Client client) {
    int index = _clients.indexWhere((e) => e.id == client.id);
    _clients[index] = client;
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
