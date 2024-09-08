import 'dart:async';
import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/message.dart';
import '../../repos/connection_stream_service.dart';

part 'stream_logger_event.dart';
part 'stream_logger_state.dart';

class StreamLoggerBloc extends Bloc<StreamLoggerEvent, StreamLoggerState> {
  StreamLoggerBloc({required this.streamService}) : super(SLInitialState()) {
    on<SLMessageReceivedEvent>(messageReceived);
  }

  final ConnectionStreamService streamService;

  Future messageReceived(SLMessageReceivedEvent event, Emitter<StreamLoggerState> emit) async {
    streamService.messages.add(event.message);

    emit(SLNewMessageState(message: event.message));

    // emit.forEach(
    //   streamService.getDummyStream(),
    //   onData: (message) {
    //     return SLNewMessageState(message: message);
    // });
  }
}
