import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EarningLineForm extends StatefulWidget {
  EarningLineForm({super.key});

  final descriptionController = TextEditingController();
  final hoursController = TextEditingController();
  final rateController = TextEditingController();

  @override
  State<EarningLineForm> createState() => _EarningLineFormState();

}

class _EarningLineFormState extends State<EarningLineForm> {
  

  

  @override
  Widget build(BuildContext context) {
    return Column (
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Earning Description',
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
                controller: widget.hoursController,
                decoration: const InputDecoration(
                  labelText: 'Hours',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^\d*\.?\d{0,2}$'),
                  ),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter hours';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                controller: widget.rateController,
                decoration: const InputDecoration(
                  labelText: 'Rate',
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
                    return 'Please enter rate';
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