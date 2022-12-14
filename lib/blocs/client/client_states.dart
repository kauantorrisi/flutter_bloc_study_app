import 'package:flutter_bloc_study/models/client_model.dart';

abstract class ClientStates {
  final List<Client> clients;

  ClientStates(this.clients);
}

class ClientInitialState extends ClientStates {
  ClientInitialState(super.clients);
}

class ClientSuccessState extends ClientStates {
  ClientSuccessState(super.clients);
}
