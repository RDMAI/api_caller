import 'package:api_caller/di_provider.dart';
import 'package:api_caller/repos/connection_stream_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/connection_builder_view/connection_builder_view_bloc.dart';

class ConnectionBuilderUi extends StatefulWidget {
  const ConnectionBuilderUi({super.key});

  @override
  State<StatefulWidget> createState() => _ConnectionBuilderUiState();
}

class _ConnectionBuilderUiState extends State<ConnectionBuilderUi> {
  final urlController = TextEditingController();

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = getIt<ConnectionBuilderViewBloc>();
    return BlocBuilder<ConnectionBuilderViewBloc, ConnectionBuilderViewState>(
      bloc: bloc,
      builder: (context, state) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'URL...',
                  ),
                  controller: urlController,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        // if connected - button will be disabled
                        onPressed: state.connected
                            ? null
                            : () => bloc.add(ConnectedEvent(url: urlController.text)),
                        child: const Text("Connect")),
                    ElevatedButton(
                        // if not connected - button will be disabled
                        onPressed: state.connected
                            ? () => bloc.add(DisconnectedEvent())
                            : null,
                        child: const Text("Disconnect"))
                  ],
                ),
                Text(state is ConnectionError ? state.message : "  ")
              ],
            ),
          ),
        );
      },
    );
  }
}
