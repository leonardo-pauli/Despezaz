import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../stores/transaction_store.dart';

class AddTransactionScreen extends StatefulWidget {
  final TransactionStore store;

  const AddTransactionScreen({super.key, required this.store});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  String _selectedCategory = "Alimentação";
  bool _isExpense = true;
  DateTime _selectedDate = DateTime.now();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final transaction = Transaction(
        id: DateTime.now().millisecondsSinceEpoch,
        title: _titleController.text,
        amount: double.parse(_amountController.text),
        category: _selectedCategory,
        date: _selectedDate,
        isExpense: _isExpense,
      );

      // Adiciona a transação na store atualizando a lista observável
      widget.store.setTransaction([
        ...widget.store.transactions,
        transaction,
      ]);

      Navigator.pop(context);
    }
  }

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicionar Transação")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: "Título"),
                  validator: (value) =>
                      value!.isEmpty ? "Informe o título" : null,
                ),
                SizedBox(height: 10),

                // Valor
                TextFormField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Valor"),
                  validator: (value) =>
                      value!.isEmpty ? "Informe o valor" : null,
                ),
                SizedBox(height: 10),

                // Categoria
                DropdownButtonFormField<String>(
                  initialValue: _selectedCategory,
                  items: [
                    "Alimentação",
                    "Transporte",
                    "Lazer",
                    "Educação",
                    "Saúde",
                    "Outro"
                  ]
                      .map((cat) => DropdownMenuItem(
                            value: cat,
                            child: Text(cat),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  },
                  decoration: InputDecoration(labelText: "Categoria"),
                ),
                SizedBox(height: 10),

                // Receita ou Despesa
                SwitchListTile(
                  title: Text(_isExpense ? "Despesa" : "Receita"),
                  value: _isExpense,
                  onChanged: (value) {
                    setState(() {
                      _isExpense = value;
                    });
                  },
                ),
                SizedBox(height: 10),

                // Data
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Data: ${_selectedDate.toLocal()}".split(' ')[0]),
                    TextButton(
                      onPressed: _pickDate,
                      child: Text("Selecionar Data"),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Botão Salvar
                Center(
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: Text("Salvar Transação"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
