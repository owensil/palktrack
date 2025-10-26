import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/paystub.dart';
import 'paystub_form/paystub_form.dart';
import 'widgets/paystub_history_page.dart';

void main() {
  runApp(const Palktrack());
}

class Palktrack extends StatelessWidget {
  const Palktrack({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Palktrack',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  List<Paystub> paystubs = [];

  void addPaystub(Paystub paystub) {
    paystubs.add(paystub);
    notifyListeners();
  }

  void deletePaystub(Paystub paystub) {
    paystubs.remove(paystub);
    notifyListeners();
  }

  double get totalEarnings => paystubs.fold(0, (sum, stub) => sum + stub.netPay);
  
  double get totalHours => paystubs.fold(0, (sum, stub) => sum + stub.earnings.fold(0, (hsum, eline) => hsum + eline.hours));
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const PaystubForm();
      case 1:
        page = const PaystubHistoryPage();
      default:
        throw UnimplementedError('No widget for $selectedIndex');
    }


    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: MediaQuery.of(context).size.width >= 600,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.add),
                  label: Text('New Entry'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.history),
                  label: Text('History'),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ),
        ],
      ),
    );
  }
}