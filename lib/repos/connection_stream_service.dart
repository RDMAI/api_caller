import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:signalr_netcore/signalr_client.dart';

import 'package:api_caller/models/message.dart';

import '../models/Result.dart';

class ConnectionStreamService {
  List<Message> messages = List.empty();
  List<String> methodNames = List.empty();
  // serverUrl = "http://localhost:5000";
  HubConnection? hubConnection;

  StreamController<Message>? streamController;

  bool connected = false;

  Future<Result> initConnection(String serverUrl) async {
    try {
      disposeConnection();

      hubConnection  = HubConnectionBuilder().withUrl(serverUrl).build();

      streamController = StreamController<Message>();

      hubConnection!.on("ReceiveMessage", (args) {
        if (args != null && args.isNotEmpty) {
          var decodedJson = jsonDecode(args.first as String);
          
          streamController!.add(Message(
            content: decodedJson["content"],
            method: "ReceiveMessage",
            sender: decodedJson["sender"],
            receiver: decodedJson["receiver"],
            sentAt: decodedJson["sentAt"],
            receivedAt: DateTime.now()
          ));
        }
      });

      //hubConnection!.onclose((error) {} as ClosedCallback);

      // hubConnection!.onclose((Exception error) {
      //   streamController!.add(Message(
      //     content: error.,
      //     method: method,
      //     sender: sender,
      //     receiver: receiver,
      //     sentAt: sentAt,
      //     receivedAt: receivedAt
      //   ));
      // });

      await hubConnection!.start();

      return Result.successfull();
    } catch (ex) {
      print(ex.toString());
      return Result.failed(ex.toString());
    }
  }

  void disposeConnection() {
    if (hubConnection != null) {
      hubConnection!.stop();
      hubConnection = null;
      streamController!.done;
      streamController = null;
      connected = false;
    }
  }

  // Stream<Message> getDummyStream() async* {
  //   for (var i = 0; i < 200; i++) {
  //     Future.delayed(const Duration(seconds: 5));

  //     var sentAtBuf = DateTime.now();

  //     yield Message(
  //       content: "message content ${i+1}",
  //       method: "dummy method",
  //       sender: "dummy sender",
  //       receiver: "dummy receiver",
  //       sentAt: DateTime(sentAtBuf.year, sentAtBuf.month, sentAtBuf.day - 1),
  //       receivedAt: DateTime.now()
  //     );
  //   }
  // }
}