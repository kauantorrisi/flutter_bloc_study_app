import 'package:flutter_bloc_study/models/client_model.dart';

class ClientsRepository {
  final List<Client> _clients = [];

  List<Client> loadClients() {
    _clients.addAll([
      Client(name: 'Kauan Torrisi'),
      Client(name: 'Kenai Torrisi'),
      Client(name: 'Paloma Torrisi'),
      Client(name: 'Indira Naiara Torrisi'),
      Client(name: 'Felipe Ribeiro de O. Souza'),
    ]);
    return _clients;
  }

  List<Client> addClient(Client client) {
    _clients.add(client);
    return _clients;
  }

  List<Client> removeClient(Client client) {
    _clients.remove(client);
    return _clients;
  }
}
