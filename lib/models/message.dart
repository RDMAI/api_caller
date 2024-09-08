import 'package:equatable/equatable.dart';

class Message extends Equatable {
  const Message({
    required this.content,
    required this.method,
    required this.sender,
    required this.receiver,
    required this.sentAt,
    required this.receivedAt
  });
  
  final String content;
  final String method;
  final String sender;
  final String receiver;
  final DateTime sentAt;
  final DateTime receivedAt;
  
  @override
  List<Object?> get props => [content, method, sender, receiver, sentAt, receivedAt];
}