import 'package:flutter_bloc_study/models/client_model.dart';

abstract class ClientEvents {}

class LoadClientEvent extends ClientEvents {}

class AddClientEvent extends ClientEvents {
  final Client client;

  AddClientEvent(this.client);
}

class RemoveClientEvent extends ClientEvents {
  final Client client;

  RemoveClientEvent(this.client);
}
