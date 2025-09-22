import 'package:despezaz/models/transaction.dart';
import 'package:mobx/mobx.dart';

part 'transaction_store.g.dart';

class TransactionStore = _TransactionStore with _$TransactionStore;

abstract class _TransactionStore with Store{
  @observable
  ObservableList<Transaction> transactions = ObservableList<Transaction>();

    @computed
  double get totalBalance =>
      transactions.fold(0, (sum, t) => sum + (t.isExpense ? -t.amount : t.amount));

  @computed
  double get totalExpenses =>
      transactions.where((t) => t.isExpense).fold(0, (sum, t) => sum + t.amount);

  @computed
  double get totalIncomes =>
      transactions.where((t) => !t.isExpense).fold(0, (sum, t) => sum + t.amount);

  @action
  void removeTransaction(Transaction transaction){
    transactions.remove(transaction);
  }

  @action
  void setTransaction(List<Transaction> list){
    transactions.clear();
    transactions.addAll(list);
  }
}