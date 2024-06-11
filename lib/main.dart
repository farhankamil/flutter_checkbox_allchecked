import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CheckboxExample(),
    );
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  _CheckboxExampleState createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  List<bool> items = List.generate(3, (index) => false);
  bool isChecked = false;
  bool isSelectedAll = false;

  void countCheckBox() {
    int selectedCount = items.where((item) => item).length;

    setState(() {
      isChecked = selectedCount > 0;
      isSelectedAll = selectedCount == items.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox Example'),
      ),
      body: Column(
        children: [
          Switch(
            value: isSelectedAll,
            onChanged: (value) {
              var temp = List.generate(items.length, (index) => value);
              setState(() {
                isSelectedAll = value;
                items = temp;
              });
              countCheckBox();
            },
            activeColor: Colors.blue,
            activeTrackColor: Colors.lightBlueAccent,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Checkbox(
                  value: items[index],
                  onChanged: (value) {
                    setState(() {
                      items[index] = value!;
                      countCheckBox();
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
