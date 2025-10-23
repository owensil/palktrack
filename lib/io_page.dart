import 'package:flutter/material.dart';
import 'shift_input_form.dart';

class IOPage extends StatefulWidget {
  const IOPage({super.key});

  @override
  State<IOPage> createState() => _IOPageState();
}

class _IOPageState extends State<IOPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ShiftInputForm(),
          TextFormField(
            
            decoration: const InputDecoration(hintText: 'Start Date'),
            keyboardType: TextInputType.datetime,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a date';
              }
              return null;
            },
          ),
          TextFormField(

            decoration: const InputDecoration(hintText: 'Start Date'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a date';
              }
              return null;
            },
          ),
          TextFormField(

            decoration: const InputDecoration(hintText: 'Start Date'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a date';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}