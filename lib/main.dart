// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter CheckBox All Checked'),
    );
  }
}

class CheckBoxModal {
  String title;
  bool value;
  CheckBoxModal({
    required this.title,
    this.value = false,
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final allChecked = CheckBoxModal(title: 'all cheked');
  final checkBoxList = [
    CheckBoxModal(title: "CheckBox 1"),
    CheckBoxModal(title: "CheckBox 2"),
    CheckBoxModal(title: "CheckBox 3"),
  ];

  onAllClicked(CheckBoxModal ckbItem) {
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;
      for (var element in checkBoxList) {
        element.value = newValue;
      }
    });
  }

  onItemCliked(CheckBoxModal ckbItem) {
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;

      if (!newValue) {
        allChecked.value = false;
      } else {
        final allListChecked = checkBoxList.every((element) => element.value);
        allChecked.value = allListChecked;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => onAllClicked(allChecked),
            leading: Checkbox(
              value: allChecked.value,
              onChanged: (value) => onAllClicked(allChecked),
            ),
            title: Text(allChecked.title),
          ),
          const Divider(),
          ...checkBoxList.map(
            (item) => ListTile(
              onTap: () => onItemCliked(item),
              leading: Checkbox(
                value: item.value,
                onChanged: (value) => onItemCliked(item),
              ),
              title: Text(item.title),
            ),
          )
        ],
      ),
    );
  }
}
