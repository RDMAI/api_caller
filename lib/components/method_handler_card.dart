import 'package:flutter/material.dart';

class MethodHandlerCard extends StatelessWidget {
  const MethodHandlerCard({super.key});
  
  @override
  Widget build(BuildContext context) {
    return 
  }
}

class NoArgsHandler extends StatefulWidget {
  const NoArgsHandler({super.key, required this.methodName});
  final String methodName;

  @override
  State<StatefulWidget> createState() => _NoArgsHandlerState();
}

class _NoArgsHandlerState extends State<NoArgsHandler> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.methodName),
        const SizedBox(width:30),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Execute")
        )
      ],
    );
  }
}

class SingleArgumentHandler extends StatefulWidget {
  const SingleArgumentHandler({super.key, required this.methodName});
  final String methodName;

  @override
  State<StatefulWidget> createState() => _SingleArgumentHandlerState();
}

class _SingleArgumentHandlerState extends State<SingleArgumentHandler> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.methodName),
        const SizedBox(width:30),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Execute")
        )
      ],
    );
  }
}