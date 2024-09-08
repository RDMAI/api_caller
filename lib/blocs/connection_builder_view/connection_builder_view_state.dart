part of 'connection_builder_view_bloc.dart';

sealed class ConnectionBuilderViewState extends Equatable {
  const ConnectionBuilderViewState(this.connected);
  
  final bool connected;

  @override
  List<Object> get props => [connected];
}

final class Disconected extends ConnectionBuilderViewState {
  const Disconected() : super(false);
}

final class Connected extends ConnectionBuilderViewState {
  const Connected() : super(true);
}

final class ConnectionError extends ConnectionBuilderViewState {
  const ConnectionError(this.message) : super(false);

  final String message;

  @override
  List<Object> get props => [connected, message];
}
