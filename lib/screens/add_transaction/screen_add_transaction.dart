import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:money_management/db/category/category_db.dart';
import 'package:money_management/models/category/category_models.dart';
import 'package:money_management/models/transaction/transaction_model.dart';

import '../../db/trasactions/trasactions_db.dart';

class ScreenaddTransaction extends StatefulWidget {
  static const routeName = 'add-transaction';
  const ScreenaddTransaction({super.key});

  @override
  State<ScreenaddTransaction> createState() => _ScreenaddTransactionState();
}

class _ScreenaddTransactionState extends State<ScreenaddTransaction> {
  DateTime? _selectedDate;
  CategoryType? _selectedcategorytype;
  CategoryModel? _selectedcategorymodel;
  String? _categoryID;
  final _purposeTextEditingController = TextEditingController();
  final _amountTextEditingController = TextEditingController();
  @override
  void initState() {
    _selectedcategorytype = CategoryType.income;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //porpose
              TextFormField(
                controller: _purposeTextEditingController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Purpose',
                ),
              ),
              TextFormField(
                controller: _amountTextEditingController,
                //amount
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Amount',
                ),
              ),
              //calendar

              TextButton.icon(
                onPressed: () async {
                  final _selectedDatetemp = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 30)),
                    lastDate: DateTime.now(),
                  );
                  if (_selectedDatetemp == null) {
                    return;
                  } else {
                    _selectedDate = _selectedDatetemp;
                    setState(() {
                      _selectedDate = _selectedDatetemp;
                    });
                  }
                },
                icon: const Icon(Icons.calendar_view_week),
                label: Text(_selectedDate == null
                    ? 'Select Date'
                    : _selectedDate.toString()),
              ),

              //Category
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: CategoryType.income,
                        groupValue: _selectedcategorytype,
                        onChanged: (newValu) {
                          setState(() {
                            _selectedcategorytype = CategoryType.income;
                            _categoryID = null;
                          });
                        },
                      ),
                      Text('Income'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: CategoryType.expense,
                        groupValue: _selectedcategorytype,
                        onChanged: (newValu) {
                          setState(() {
                            _selectedcategorytype = CategoryType.expense;
                            _categoryID = null;
                          });
                        },
                      ),
                      Text('Expense'),
                    ],
                  ),
                ],
              ),
              //DropdownButton
              //category type
              DropdownButton<String>(
                hint: Text('Select Category'),
                value: _categoryID,
                items: (_selectedcategorytype == CategoryType.income
                        ? CategoryDB().incomeCategory
                        : CategoryDB().expenseCategory)
                    .value
                    .map((e) {
                  return DropdownMenuItem(
                    value: e.id,
                    child: Text(e.name),
                    onTap: (){
                      _selectedcategorymodel = e;
                    },
                  );
                }).toList(),
                onChanged: (SelectedValu) {
                  setState(() {
                    _categoryID = SelectedValu;
                  });
                },
              ),
              //submit
              ElevatedButton.icon(
                  onPressed: () {
                    addTrasaction();

                  },
                  icon: Icon(Icons.check),
                  label: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addTrasaction() async {
    final purposeText = _purposeTextEditingController.text;
    final amountText = _amountTextEditingController.text;
    if (purposeText.isEmpty) {
      return;
    }
    if (amountText.isEmpty) {
      return;
    }
    // if (_categoryID == null) {
    //   return;
    // }
    if (_selectedDate == null) {
      return;
    }
    if(_selectedcategorymodel == null){
      return;
    }
   final parsedAmount = double.tryParse(amountText);
   if(parsedAmount == null){
    return;
   }
    // _selectedDate
    //_selectedcategorytype
    //_categoryID
   final Model = TransactionModel(
        Purpose: purposeText,
        amount: parsedAmount,
        date: _selectedDate!,
        type: _selectedcategorytype!,
        category: _selectedcategorymodel!);
      await  TransactionDB.instance.addTrasaction(Model);
      Navigator.of(context).pop();
      TransactionDB.instance.refriesh();

  }
}
