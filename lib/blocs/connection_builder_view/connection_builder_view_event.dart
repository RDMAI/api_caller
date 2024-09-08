part of 'connection_builder_view_bloc.dart';

sealed class ConnectionBuilderViewEvent extends Equatable {
  const ConnectionBuilderViewEvent();

  @override
  List<Object> get props => [];
}

final class ConnectedEvent extends ConnectionBuilderViewEvent {
  const ConnectedEvent({required this.url}); 
  
  final String url;

  @override
  List<Object> get props => [url];
}

final class DisconnectedEvent extends ConnectionBuilderViewEvent {}
