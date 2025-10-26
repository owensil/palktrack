import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TaxLineForm extends StatefulWidget {
  const TaxLineForm({super.key});

  @override
  State<TaxLineForm> createState() => _TaxLineFormState();
}

class _TaxLineFormState extends State<TaxLineForm> {
  final fedWithholdingController = TextEditingController();
  final fedMedicareController = TextEditingController();
  final fedSocSecController = TextEditingController();
  final stateWithholdingController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Column (
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: fedWithholdingController,
                decoration: const InputDecoration(
                  labelText: 'Federal Withholding',
                  border: OutlineInputBorder(),
                  prefixText: '\$',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^\d*\.?\d{0,3}$'),
                  ),
                ],
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
                controller: fedMedicareController,
                decoration: const InputDecoration(
                  labelText: 'Federal Medicare',
                  border: OutlineInputBorder(),
                  prefixText: '\$',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^\d*\.?\d{0,3}$'),
                  ),
                ],
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
                controller: fedSocSecController,
                decoration: const InputDecoration(
                  labelText: 'Federal Social Security (OASDI)',
                  border: OutlineInputBorder(),
                  prefixText: '\$',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^\d*\.?\d{0,3}$'),
                  ),
                ],
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
                controller: stateWithholdingController,
                decoration: const InputDecoration(
                  labelText: 'State Withholding',
                  border: OutlineInputBorder(),
                  prefixText: '\$',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^\d*\.?\d{0,3}$'),
                  ),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
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