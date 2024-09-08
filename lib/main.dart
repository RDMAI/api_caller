import 'package:api_caller/components/stream_logger.dart';
import 'package:api_caller/repos/connection_stream_service.dart';
import 'package:flutter/material.dart';

import 'components/connection_builder_ui.dart';
import 'components/methods_tabs_view.dart';
import 'di_provider.dart';

void main() {
  // register dependencies
  initDI();

  // // create a parallel stream of messages
  // var streamService = getIt<ConnectionStreamService>();
  // var stream = streamService.initStream();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MainAppBody()
      )
    );
  }
}

class MainAppBody extends StatefulWidget {
  const MainAppBody({super.key});

  @override
  State<StatefulWidget> createState() => _MainAppBodyState();
}

class _MainAppBodyState extends State<MainAppBody> {
  // if application is closed this will close the connection immediatelly
  @override
  void dispose() {
    getIt<ConnectionStreamService>().disposeConnection();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.black)
            ),
            child: const Column(
              children: [
                Flexible(child: ConnectionBuilderUi()),
                Flexible(child: MethodsTabsView()),
              ],
            ),
          ),
        ),
        
        const Expanded(child: StreamLogger())
      ],
    );
  }
}
