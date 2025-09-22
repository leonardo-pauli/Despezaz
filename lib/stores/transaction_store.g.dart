// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransactionStore on _TransactionStore, Store {
  Computed<double>? _$totalBalanceComputed;

  @override
  double get totalBalance => (_$totalBalanceComputed ??= Computed<double>(
    () => super.totalBalance,
    name: '_TransactionStore.totalBalance',
  )).value;
  Computed<double>? _$totalExpensesComputed;

  @override
  double get totalExpenses => (_$totalExpensesComputed ??= Computed<double>(
    () => super.totalExpenses,
    name: '_TransactionStore.totalExpenses',
  )).value;
  Computed<double>? _$totalIncomesComputed;

  @override
  double get totalIncomes => (_$totalIncomesComputed ??= Computed<double>(
    () => super.totalIncomes,
    name: '_TransactionStore.totalIncomes',
  )).value;

  late final _$transactionsAtom = Atom(
    name: '_TransactionStore.transactions',
    context: context,
  );

  @override
  ObservableList<Transaction> get transactions {
    _$transactionsAtom.reportRead();
    return super.transactions;
  }

  @override
  set transactions(ObservableList<Transaction> value) {
    _$transactionsAtom.reportWrite(value, super.transactions, () {
      super.transactions = value;
    });
  }

  late final _$_TransactionStoreActionController = ActionController(
    name: '_TransactionStore',
    context: context,
  );

  @override
  void removeTransaction(Transaction transaction) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
      name: '_TransactionStore.removeTransaction',
    );
    try {
      return super.removeTransaction(transaction);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTransaction(List<Transaction> list) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
      name: '_TransactionStore.setTransaction',
    );
    try {
      return super.setTransaction(list);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transactions: ${transactions},
totalBalance: ${totalBalance},
totalExpenses: ${totalExpenses},
totalIncomes: ${totalIncomes}
    ''';
  }
}
