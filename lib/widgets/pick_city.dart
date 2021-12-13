import 'package:flutter/material.dart';

class PickCity extends StatefulWidget {
  const PickCity({Key? key}) : super(key: key);

  @override
  _PickCityState createState() => _PickCityState();
}

class _PickCityState extends State<PickCity> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick city'),
      ),
      body: Form(
          child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _textController,
                decoration: const InputDecoration(
                    labelText: 'city',
                    hintText: 'enter city',
                    border: OutlineInputBorder()),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context, _textController.text);
              },
              icon: const Icon(Icons.search))
        ],
      )),
    );
  }
}
