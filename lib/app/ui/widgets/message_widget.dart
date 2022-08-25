import 'package:flutter/material.dart';

class SendMessageField extends StatelessWidget {
  final TextEditingController? textcontroller;
  SendMessageField({
    Key? key, this.textcontroller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textcontroller,
      decoration: const InputDecoration(labelText: 'mesaj gönder'),
    );
  }
}