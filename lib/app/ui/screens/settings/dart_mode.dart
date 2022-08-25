
import 'package:flutter/material.dart';

class DartModeScreen extends StatelessWidget {
  const DartModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dark mode'),
      ),
      body: Column(
        children: [
          RadioListTile(
            value: 1,
            groupValue: 1,
            title: Text('Off'),
            onChanged:(value){

          }),
          RadioListTile(
              value: 2,
              groupValue: 1,
              title: Text('On'),
              onChanged:(value){

              }),
          RadioListTile(
              value: 3,
              groupValue: 1,
              title: Text('System'),
              onChanged:(value){

              })
        ],
      ),
    );
  }
}
