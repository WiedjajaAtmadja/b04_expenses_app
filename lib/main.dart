import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExpenseApp(title: 'Expenses App'),
    );
  }
}

class ExpenseApp extends StatefulWidget {
  const ExpenseApp({super.key, required this.title});
  final String title;

  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 'tx1',
      title: 'Sarapan',
      amount: 25000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'tx2',
      title: 'Makan siang',
      amount: 38000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'tx3',
      title: 'Makan malam',
      amount: 45000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'tx4',
      title: 'Makan malam sekali lagi',
      amount: 45000,
      date: DateTime.now(),
    ),
  ];

  void _showInputSheet(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Title')),
            TextField(decoration: InputDecoration(labelText: 'Amount')),
            TextButton(onPressed: () {}, child: Text('Choose Date')),
            ElevatedButton(onPressed: () {}, child: Text('Add Transaction')),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: _userTransactions.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text(_userTransactions[index].title),
              subtitle: Text(
                  DateFormat.yMMMEd().format(_userTransactions[index].date)),
              trailing: Text('Rp. ${_userTransactions[index].amount}'),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showInputSheet(context),
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
