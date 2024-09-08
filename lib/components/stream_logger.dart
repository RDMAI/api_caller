import 'dart:collection';
import 'package:intl/intl.dart';

import 'package:api_caller/blocs/stream_logger/stream_logger_bloc.dart';
import 'package:api_caller/repos/connection_stream_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../di_provider.dart';
import '../models/message.dart';

class StreamLogger extends StatefulWidget {
  const StreamLogger({super.key});

  @override
  State<StatefulWidget> createState() => _StreamLoggerState();
}

class _StreamLoggerState extends State<StreamLogger> {
  final _controller = TextEditingController();
  
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var service = getIt<ConnectionStreamService>();

    return BlocBuilder<StreamLoggerBloc, StreamLoggerState>(
      bloc: getIt<StreamLoggerBloc>(),
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [for (var mes in service.messages) LogItem(mes: mes)],
            ),
          )
        );
      },
    );
  }
}

class LogItem extends StatelessWidget {
  const LogItem({super.key, required this.mes});

  static final formatter = DateFormat('yy MMM dd - hh:mm:ss');
  final Message mes;

  @override
  Widget build(BuildContext context) {
    return Text("{${formatter.format(mes.sentAt)}} ${mes.sender} : ${mes.content}");
  }
}