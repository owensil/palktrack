import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/paystub.dart';
import '../main.dart';
import 'date_picker_form_field.dart';

class PaystubForm extends StatefulWidget {
  const PaystubForm({super.key});

  @override
  State<PaystubForm> createState() => _PaystubFormState();
}

class _PaystubFormState extends State<PaystubForm> {
  final _formKey = GlobalKey<FormState>();
  final _straightHoursController = TextEditingController();
  final _overtimeHoursController = TextEditingController();
  final _rateController = TextEditingController();
  final _grossPayController = TextEditingController();
  final _netPayController = TextEditingController();
  final Map<String, TextEditingController> _deductionControllers = {};
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  DateTime _payDate = DateTime.now();

  // @override
  // void dispose() {
  //   _straightHoursController.dispose();
  //   _overtimeHoursController.dispose();
  //   _rateController.dispose();
  //   _grossPayController.dispose();
  //   _netPayController.dispose();
  //   _deductionControllers.values.forEach((controller) => controller.dispose());
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Paystub Entry',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  // controller: _overtimeHoursController,
                  decoration: const InputDecoration(
                    labelText: 'Employer',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter employer name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DatePickerFormField(
                        initialDate: _startDate,
                        label: 'Pay Period Start',
                        onDateSelected: (date) {
                          setState(() {
                            _startDate = date;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: DatePickerFormField(
                        initialDate: _endDate,
                        label: 'Pay Period End',
                        onDateSelected: (date) {
                          setState(() {
                            _endDate = date;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: DatePickerFormField(
                        initialDate: _payDate,
                        label: 'Pay Date',
                        onDateSelected: (date) {
                          setState(() {
                            _payDate = date;
                          });
                        },
                      ),
                    ),
                  ]
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        // controller: _straightHoursController,
                        decoration: const InputDecoration(
                          labelText: 'Hours Worked',
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
                            return 'Please enter hours worked';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        // controller: _rateController,
                        decoration: const InputDecoration(
                          labelText: 'Hourly Rate',
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
                            return 'Please enter hourly rate';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        // controller: _overtimeHoursController,
                        decoration: const InputDecoration(
                          labelText: 'Overtime',
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
                            return 'Please enter hours worked';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        // controller: _rateController,
                        decoration: const InputDecoration(
                          labelText: 'Hourly Rate',
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
                            return 'Please enter hourly rate';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        // controller: _grossPayController,
                        decoration: const InputDecoration(
                          labelText: 'Gross Pay',
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
                            return 'Please enter gross pay';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        // controller: _netPayController,
                        decoration: const InputDecoration(
                          labelText: 'Net Pay',
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
                            return 'Please enter net pay';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Save Paystub'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // final paystub = Paystub(
      //   payPeriodStart: _startDate,
      //   payPeriodEnd: _endDate,
      //   straightHoursWorked: double.parse(_straightHoursController.text),
      //   overtimeHoursWorked: double.parse(_overtimeHoursController.text),
      //   hourlyRate: double.parse(_rateController.text),
      //   grossPay: double.parse(_grossPayController.text),
      //   netPay: double.parse(_netPayController.text),
      //   deductions: _deductionControllers.map(
      //     (key, controller) => MapEntry(key, double.parse(controller.text)),
      //   ),
      // );

      // // Save paystub to app state
      // context.read<MyAppState>().addPaystub(paystub);
      
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Paystub saved')),
      // );

      // // Clear form
      // _formKey.currentState!.reset();
      // _straightHoursController.clear();
      // _overtimeHoursController.clear();
      // _rateController.clear();
      // _grossPayController.clear();
      // _netPayController.clear();
      // _deductionControllers.values.forEach((controller) => controller.clear());
      return;
    }
  }
}