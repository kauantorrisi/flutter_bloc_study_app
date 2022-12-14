import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_study/blocs/client/client_bloc.dart';
import 'package:flutter_bloc_study/blocs/client/client_events.dart';
import 'package:flutter_bloc_study/blocs/client/client_states.dart';
import 'package:flutter_bloc_study/models/client_model.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  late final ClientBloc bloc;

  @override
  void initState() {
    bloc = ClientBloc();
    bloc.add(LoadClientEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  String randomName() {
    return [
      'Suely Pinheiro',
      'José Carlos',
      'Suyan Torrisi',
      'Luiz Torrisi',
      'Kauan Torrisi'
    ].elementAt(Random().nextInt(5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              bloc.add(AddClientEvent(Client(name: randomName())));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: BlocBuilder<ClientBloc, ClientStates>(
            bloc: bloc,
            builder: (context, state) {
              if (state is ClientInitialState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ClientSuccessState) {
                final clientsList = state.clients;

                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: clientsList.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Text(clientsList[index].name.substring(0, 1)),
                      ),
                    ),
                    title: Text(clientsList[index].name),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        bloc.add(RemoveClientEvent(clientsList[index]));
                      },
                    ),
                  ),
                );
              }
              return Container();
            }),
      ),
    );
  }
}
