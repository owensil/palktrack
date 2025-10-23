import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/paystub.dart';
import '../main.dart';

class PaystubHistoryPage extends StatelessWidget {
  const PaystubHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.paystubs.isEmpty) {
      return const Center(
        child: Text('No paystubs recorded yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Summary',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Total Hours: ${appState.totalHours.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Total Earnings: \$${appState.totalEarnings.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
        for (var paystub in appState.paystubs)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              child: ListTile(
                title: Text(
                  'Date: ${paystub.payPeriodStart.month}/${paystub.payPeriodStart.day}/${paystub.payPeriodStart.year}',
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hours: ${paystub.earnings.fold(0.0, (sum, eline) => sum + eline.hours)}'),
                    // Text('Rate: \$${paystub.hourlyRate}/hr'),
                    Text('Gross: \$${paystub.grossPay}'),
                    Text('Net: \$${paystub.netPay}'),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => appState.deletePaystub(paystub),
                ),
              ),
            ),
          ),
      ],
    );
  }
}