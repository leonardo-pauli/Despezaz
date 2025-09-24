import 'package:despezaz/screens/add_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/transaction_store.dart';

final transactionStore = TransactionStore();

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Observer(
              builder: (_) => Container(
                width: 220,
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  transactionStore.totalBalance.toStringAsFixed(2),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: transactionStore.totalBalance > 0 ? Colors.green : Colors.red[400],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Observer(
                builder: (_) => ListView.separated(
                  itemCount: transactionStore.transactions.length,
                  itemBuilder: (_, i) {
                    final t = transactionStore.transactions[i];
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey[400]!),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      title: Text(
                        t.title,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        t.category,
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                      trailing: Text(
                        (t.isExpense ? "- " : "+ ") + "R\$ ${t.amount}",
                        style: TextStyle(
                          color: t.isExpense ? Colors.red : Colors.green,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(height: 10),
                ),
              ),
            ),
            IconButton(
              iconSize: 36,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddTransactionScreen(store: transactionStore),
                  ),
                );
              },
              icon: Icon(Icons.add),
              color: Colors.white,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
