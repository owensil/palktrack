import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeductionLineForm extends StatefulWidget {
  const DeductionLineForm({super.key});

  @override
  State<DeductionLineForm> createState() => _DeductionLineFormState();
}

class _DeductionLineFormState extends State<DeductionLineForm> {
  final descriptionController = TextEditingController();
  final hoursController = TextEditingController();
  final rateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column (
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Deduction Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                controller: rateController,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                  prefixText: '\$',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^\d*\.?\d{0,2}$'),
                  ),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
      ]
    );
  }
}