import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/paystub.dart';
import '../main.dart';
import 'earning_line_form.dart';
import 'tax_line_form.dart';
import 'deduction_line_form.dart';
import 'contribution_line_form.dart';
import '../widgets/date_picker_form_field.dart';

class PaystubForm extends StatefulWidget {
  const PaystubForm({super.key});

  @override
  State<PaystubForm> createState() => _PaystubFormState();
}

class _PaystubFormState extends State<PaystubForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _employerController = TextEditingController();
  final Map<String, TextEditingController> _earningControllers = {};
  final Map<String, TextEditingController> _deductionsControllers = {};
  final Map<String, TextEditingController> _taxesControllers = {};
  final Map<String, TextEditingController> _contributionsControllers = {};

  final List<Widget> _earningFields = [
    EarningLineForm(),
    SizedBox(height: 8,),
  ];
  final List<Widget> _deductionFields = [];
  final List<Widget> _taxFields = [];
  final List<Widget> _contributionFields = [];

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  DateTime _payDate = DateTime.now();

  @override
  void dispose() {
    _earningControllers.values.forEach((controller) => controller.dispose());
    _deductionsControllers.values.forEach((controller) => controller.dispose());
    _taxesControllers.values.forEach((controller) => controller.dispose());
    _contributionsControllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Text(
                  'New Paystub Entry',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _employerController,
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
                // +++
                // Dates
                // +++
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
                    SizedBox(width: 8,),
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
                    SizedBox(width: 8,),
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
                // +++
                // Earnings
                // +++
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var each in _earningFields)
                      each,
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _earningFields.add(EarningLineForm());
                        });
                      },
                      icon: Icon(Icons.add),
                      label: Text('Add Earning')
                    )
                  ],
                ),
                const SizedBox(height: 16),
                // +++
                // Taxes
                // +++
                TaxLineForm(),
                const SizedBox(height: 16),
                // +++
                // Deductions
                // +++
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var each in _deductionFields)
                      each,
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _deductionFields.add(const DeductionLineForm());
                        });
                      },
                      icon: Icon(Icons.add),
                      label: Text('Add Deduction')
                    )
                  ],
                ),
                const SizedBox(height: 16),
                // +++
                // Contributions
                // +++
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var each in _contributionFields)
                      each,
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _contributionFields.add(const ContributionLineForm());
                        });
                      },
                      icon: Icon(Icons.add),
                      label: Text('Add Contribution')
                    )
                  ],
                ),
                const SizedBox(height: 16),
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
      final paystub = Paystub(
        employerName: _employerController.text,
        payPeriodStart: _startDate,
        payPeriodEnd: _endDate,
        payDate: _payDate,

        // straightHoursWorked: double.parse(_straightHoursController.text),
        // overtimeHoursWorked: double.parse(_overtimeHoursController.text),
        // hourlyRate: double.parse(_rateController.text),
        // grossPay: double.parse(_grossPayController.text),
        // netPay: double.parse(_netPayController.text),
        // deductions: _deductionControllers.map(
        //   (key, controller) => MapEntry(key, double.parse(controller.text)),
        // ),
      );
      for (var earning in _earningFields) {
        if (earning is EarningLineForm) {
          paystub.earnings.add(
            EarningLine(
              description: earning.descriptionController.text,
              hours: double.parse(earning.hoursController.text),
              rate: double.parse(earning.rateController.text),
            )
          );
        }
      }
      // Save paystub to app state
      context.read<MyAppState>().addPaystub(paystub);
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Paystub saved')),
      );

      // Clear form
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
