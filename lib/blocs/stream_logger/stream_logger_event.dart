part of 'stream_logger_bloc.dart';

@immutable
sealed class StreamLoggerEvent {}

final class SLMessageReceivedEvent extends StreamLoggerEvent {
  SLMessageReceivedEvent({required this.message});
  final Message message;
}
