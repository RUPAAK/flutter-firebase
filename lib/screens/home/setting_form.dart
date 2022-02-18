import 'package:coffee/shared/constants.dart';
import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Update your coffee settings',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val!.isEmpty ? "Please Enter a name" : null,
            onChanged: (val) => setState(() {
              _currentName = val;
            }),
          ),

          DropdownButtonFormField<String>(
            decoration: textInputDecoration,
            value: _currentSugars ?? '0',
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text("$sugar sugars"),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentSugars = val),
          ),

          SizedBox(height: 20.0),

          //dorpdon

          ElevatedButton(
              onPressed: () async {
                print(_currentName);
                print(_currentStrength);
              },
              style: ElevatedButton.styleFrom(primary: Colors.pink[400]),
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
