import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_management/models/transaction/transaction_model.dart';

const Transaction_Db_Name ='Transaction-db';


abstract class TransactionDbFuctions{
  Future <void> addTrasaction(TransactionModel obj);
  Future <List<TransactionModel>>getAllTransaction();
  Future <void> deleteTransaction(String id);
  
 
}
class TransactionDB implements TransactionDbFuctions{
  TransactionDB._internal();
static TransactionDB instance = TransactionDB._internal();
factory TransactionDB(){
  return instance;
}
ValueNotifier<List<TransactionModel>>TransactionListNotifier =
 ValueNotifier([]);



  @override
  Future<void> addTrasaction(TransactionModel obj) async {
  final _db = await Hive.openBox<TransactionModel>(Transaction_Db_Name);
 await _db.put(obj.id, obj);
  }
  Future <void> refriesh()async{
   final _list = await getAllTransaction();
   TransactionListNotifier.value.clear();
   TransactionListNotifier.value.addAll(_list);
   TransactionListNotifier.notifyListeners();
   _list.sort((first,second)=>second.date.compareTo(first.date));
  }
  
  @override
  Future<List<TransactionModel>> getAllTransaction()async {
   
  final _db = await Hive.openBox<TransactionModel>(Transaction_Db_Name);

  return _db.values.toList();
  }
  
  @override
  Future <void> deleteTransaction(String id) async{
      final _db = await Hive.openBox<TransactionModel>(Transaction_Db_Name);
     await _db.delete(id);
     refriesh();

   
    
    
  }

}