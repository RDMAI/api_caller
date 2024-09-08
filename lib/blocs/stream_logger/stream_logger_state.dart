part of 'stream_logger_bloc.dart';

@immutable
sealed class StreamLoggerState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SLInitialState extends StreamLoggerState {
}
final class SLNewMessageState extends StreamLoggerState {
  SLNewMessageState({required this.message});
  final Message message;

  @override
  List<Object?> get props => [message];
}
