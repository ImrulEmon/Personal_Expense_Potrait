import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/chart.dart';
//import 'package:personal_expense/widgets/user_transactions.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 70.01,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Watch',
      amount: 75.01,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'New Jacket',
      amount: 80.11,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'New Glass',
      amount: 95.01,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'New Phone',
      amount: 33.01,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'New Neckband',
      amount: 25.01,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't7',
      title: 'New Car',
      amount: 56.01,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't8',
      title: 'New Suit',
      amount: 195.01,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: chosenDate,
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Personal Expense'),
        actions: [
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransactions),
            TransactionList(
              transactions: _userTransactions,
              deleteTx: _deleteTransaction,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
