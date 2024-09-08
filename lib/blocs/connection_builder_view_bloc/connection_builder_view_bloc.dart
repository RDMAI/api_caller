import 'package:api_caller/repos/connection_stream_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'connection_builder_view_event.dart';
part 'connection_builder_view_state.dart';

class ConnectionBuilderViewBloc extends Bloc<ConnectionBuilderViewEvent, ConnectionBuilderViewState> {
  ConnectionBuilderViewBloc({required this.streamService}) : super(const Disconected()) {
    on<ConnectedEvent>(connectedAction);
    on<DisconnectedEvent>(disconnectedAction);
  }

  final ConnectionStreamService streamService;

  Future connectedAction(ConnectedEvent event, Emitter<ConnectionBuilderViewState> emit) async {
    var res = await streamService.initConnection(event.url);
    
    if (res.success) {
      emit(const Connected());
    }
    else {
      emit(ConnectionError(res.message));
    }
  }

  Future disconnectedAction(DisconnectedEvent event, Emitter<ConnectionBuilderViewState> emit) async {
    streamService.disposeConnection();
    
    emit(const Disconected());
  }
}
