import 'package:bloc/bloc.dart';

import 'package:flutter_bloc_study/blocs/client/client_events.dart';
import 'package:flutter_bloc_study/blocs/client/client_states.dart';
import 'package:flutter_bloc_study/data/clients_repository.dart';

class ClientBloc extends Bloc<ClientEvents, ClientStates> {
  final _clientsRepo = ClientsRepository();

  ClientBloc() : super(ClientInitialState([])) {
    on<LoadClientEvent>(
      (event, emit) => emit(ClientSuccessState(_clientsRepo.loadClients())),
    );

    on<AddClientEvent>(
      (event, emit) =>
          emit(ClientSuccessState(_clientsRepo.addClient(event.client))),
    );

    on<RemoveClientEvent>(
      (event, emit) => emit(
        ClientSuccessState(_clientsRepo.removeClient(event.client)),
      ),
    );
  }
}
