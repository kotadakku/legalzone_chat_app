import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModeSettingPage extends StatelessWidget {
  const ModeSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark mode'),
      ),
      body: Column(
        children: [
          RadioListTile(
              value: 1,
              groupValue: 1,
              title: const Text('Off'),
              onChanged:(value){

              }),
          RadioListTile(
              value: 2,
              groupValue: 1,
              title: const Text('On'),
              onChanged:(value){

              }),
          RadioListTile(
              value: 3,
              groupValue: 1,
              title: const Text('System'),
              onChanged:(value){

              })
        ],
      ),
    );
  }
}
