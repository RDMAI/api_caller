import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodCreateCard extends StatefulWidget {
  const MethodCreateCard({super.key});

  @override
  State<StatefulWidget> createState() => _MethodCreateCardState();

}

class _MethodCreateCardState extends State<MethodCreateCard> {
  final methodNameController = TextEditingController();
  final argNumberController = TextEditingController();
  
  @override
  void dispose() {
    methodNameController.dispose();
    argNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Wrap(
        direction: Axis.horizontal,
        spacing: BorderSide.strokeAlignCenter,
        children: [
          Container(
            constraints: const BoxConstraints(minWidth: 100, maxWidth: 200),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name of the method',
              ),
              controller: methodNameController,
            ),
          ),
          Container(
            constraints: const BoxConstraints(minWidth: 100, maxWidth: 200),
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Number of arguments',
              ),
              controller: argNumberController,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              
            },
            child: Text("Created")
          )
        ],
      ),
    );
  }
}